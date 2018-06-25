# Use an official ubuntu image
FROM ubuntu:16.04

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common apt-utils
RUN apt-get install -y build-essential git python3 python3-dev python3-pip

RUN pip3 install pip --upgrade
RUN pip3 install wheel

RUN pip3 install --trusted-host pypi.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 8000

# Set the working directory to /app
ADD ./ /code
WORKDIR /code