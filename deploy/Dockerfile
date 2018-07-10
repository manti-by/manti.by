# Use an official python 3.6 image

FROM python:3.6


# Create required dirs

RUN mkdir -p /srv/manti.by/
RUN mkdir -p /etc/manti.by/
RUN mkdir -p /run/manti.by/
RUN mkdir -p /var/log/manti.by/


# Install FFMpeg

RUN apt-get update && apt-get -y install \
  autoconf automake build-essential cmake git-core libtool libass-dev libfreetype6-dev \
  libmp3lame-dev libtheora-dev libvorbis-dev pkg-config texinfo wget zlib1g-dev yasm

RUN mkdir -p /srv/manti.by/ffmpeg/
RUN wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN tar xjvf ffmpeg-snapshot.tar.bz2 -C /srv/manti.by/

WORKDIR /srv/manti.by/ffmpeg/
RUN export PATH="/bin:$PATH" && export PKG_CONFIG_PATH="/srv/manti.by/ffmpeg/build/lib/pkgconfig"
RUN ./configure \
      --prefix="/srv/manti.by/ffmpeg/build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I/srv/manti.by/ffmpeg/build/include" \
      --extra-ldflags="-L/srv/manti.by/ffmpeg/build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="/bin" \
      --enable-gpl \
      --enable-libass \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libtheora \
      --enable-libvorbis \
      --enable-nonfree

RUN make && make install
RUN rm -rf /srv/manti.by/ffmpeg/


# Install any needed packages specified in requirements.txt

RUN apt-get update && apt-get install -y supervisor
RUN apt-get clean

COPY requirements.txt /etc/manti.by/requirements.txt
RUN pip3 install --trusted-host pypi.org --no-cache-dir -r /etc/manti.by/requirements.txt


# Setup supervisor

COPY docker/supervisor.conf /etc/manti.by/supervisor.conf
COPY docker/uwsgi.ini /etc/manti.by/uwsgi.ini
COPY docker/uwsgi_params /etc/manti.by/uwsgi_params
RUN ln -s /etc/manti.by/supervisor.conf /etc/supervisor/conf.d/manti.by.conf


# Set working directory and expose ports

WORKDIR /srv/manti.by/src/app/
EXPOSE 8888
EXPOSE 5555


# Fix file permissions

RUN chown -R www-data:www-data /srv/manti.by/
RUN chown -R www-data:www-data /run/manti.by/
RUN chown -R www-data:www-data /var/log/manti.by/


# Start app services

CMD supervisord -n