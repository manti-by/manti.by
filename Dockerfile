# Use an official python 3.9 image
FROM python:3.9-slim


# Install FFMpeg
RUN apt-get update && \
  apt-get -y install --no-install-recommends autoconf automake build-essential cmake git-core libtool \
  libass-dev libfreetype6-dev libmp3lame-dev libtheora-dev libvorbis-dev pkg-config texinfo wget zlib1g-dev yasm

RUN mkdir -p /srv/manti.by/ffmpeg/ && \
  wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
  tar xjvf ffmpeg-snapshot.tar.bz2 -C /srv/manti.by/

WORKDIR /srv/manti.by/ffmpeg/
RUN export PATH="/bin:$PATH" && export PKG_CONFIG_PATH="/srv/manti.by/ffmpeg/build/lib/pkgconfig" && \
  ./configure \
      --prefix="/srv/manti.by/ffmpeg/build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I/srv/manti.by/ffmpeg/build/include" \
      --extra-ldflags="-L/srv/manti.by/ffmpeg/build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="/bin" \
      --enable-libmp3lame \
      --enable-libtheora \
      --enable-libvorbis \
      --enable-nonfree && \
  make -j2 && \
  make install && \
  rm -rf /srv/manti.by/ffmpeg/


# Install any needed packages specified in requirements.txt
COPY requirements/base.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.org --no-cache --upgrade pip && \
  pip install --trusted-host pypi.org --no-cache -r /tmp/requirements.txt && \
  rm -rf /tmp/requirements.txt


# Remove unused packages
RUN apt-get autoremove --purge && \
  apt-get clean


# Create additional dirs and fix file permissions
RUN useradd -m -s /bin/bash manti && \
  mkdir -p /srv/manti.by/src/ /var/log/manti.by/ /var/lib/manti.by/static/ /var/lib/manti.by/content/ && \
  chown -R manti:manti /srv/manti.by/src/ /var/lib/manti.by/ /var/log/manti.by/


# Set working directory and run command
WORKDIR /srv/manti.by/src/
CMD python manage.py runserver