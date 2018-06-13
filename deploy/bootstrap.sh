#!/bin/sh
apt-get update && apt-get upgrade -y
apt-get install -y git python3-pip python3-dev python3-six
pip3 install --upgrade pip
pip3 install -r /code/requirements.txt