FROM python:3.9-slim

# Install FFMpeg
RUN apt-get update && \
  apt-get -y install --no-install-recommends autoconf automake build-essential cmake git-core libtool \
  libass-dev libfreetype6-dev libmp3lame-dev libtheora-dev libvorbis-dev pkg-config texinfo wget zlib1g-dev yasm

RUN mkdir -p /var/lib/ffmpeg/ && \
  wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
  tar xjvf ffmpeg-snapshot.tar.bz2 -C /var/lib/

WORKDIR /var/lib/ffmpeg/
RUN export PATH="/bin:$PATH" && export PKG_CONFIG_PATH="/var/lib/ffmpeg/build/lib/pkgconfig" && \
  ./configure \
      --prefix="/var/lib/ffmpeg/build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I/var/lib/ffmpeg/build/include" \
      --extra-ldflags="-L/var/lib/ffmpeg/build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="/bin" \
      --enable-libmp3lame \
      --enable-libtheora \
      --enable-libvorbis \
      --enable-nonfree && \
  make -j4 && \
  make install && \
  rm -rf /var/lib/ffmpeg/

# Install python packages specified in requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.org --no-cache-dir --upgrade pip && \
    pip install --trusted-host pypi.org --no-cache-dir -r /tmp/requirements.txt

# Remove system packages after use
RUN apt-get autoremove -y --purge autoconf automake build-essential cmake git-core pkg-config yasm && \
    apt-get clean -y

# Add base user
RUN useradd -m -s /bin/bash -d /home/manti manti && \
  mkdir -p /srv/manti/src/ /var/log/manti/ /var/lib/manti/static/ /var/lib/manti/content/ /var/lib/manti/data/ && \
  chown -R manti:manti /srv/manti/src/ /var/lib/manti/ /var/log/manti/


# Select user, set working directory and run server
USER manti
WORKDIR /srv/manti/src/
CMD python manage.py runserver