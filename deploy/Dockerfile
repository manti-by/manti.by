# Use an official python 3.6 image

FROM python:3.6


# Create required dirs

RUN mkdir -p /srv/manti.by/ffmpeg/ /etc/manti.by/ /var/run/manti.by/ /var/log/manti.by/


# Install FFMpeg

RUN apt-get update && apt-get -y install \
    autoconf automake build-essential cmake git-core libtool libass-dev libfreetype6-dev \
    libmp3lame-dev libtheora-dev libvorbis-dev pkg-config texinfo wget zlib1g-dev yasm supervisor

RUN wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
    tar xjvf ffmpeg-snapshot.tar.bz2 -C /srv/manti.by/

WORKDIR /srv/manti.by/ffmpeg/
RUN export PATH="/bin:$PATH" && export PKG_CONFIG_PATH="/srv/manti.by/ffmpeg/build/lib/pkgconfig" && \
    ./configure \
        --prefix="/srv/manti.by/ffmpeg/build" \
        --pkg-config-flags="--static" \
        --extra-cflags="-I/srv/manti.by/ffmpeg/build/include" \
        --extra-ldflags="-L/srv/manti.by/ffmpeg/build/lib" \
        --extra-libs="-lpthread -lm" \
        --bindir="bin" \
        --enable-gpl \
        --enable-libass \
        --enable-libfreetype \
        --enable-libmp3lame \
        --enable-libtheora \
        --enable-libvorbis \
        --enable-nonfree && \
    make && make install


# Copy necessary config files

COPY docker/requirements.txt /etc/manti.by/requirements.txt
COPY docker/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/supervisor.conf /etc/supervisor/conf.d/manti.by.conf
COPY docker/uwsgi.ini /etc/manti.by/uwsgi.ini


# Install any needed packages specified in requirements.txt

RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.org --no-cache-dir -r /etc/manti.by/requirements.txt


# Set working directory and expose ports

WORKDIR /srv/manti.by/src/
RUN git init && git remote add origin https://github.com/manti-by/Manti.by.git


# Clean caches

RUN rm -rf /srv/manti.by/ffmpeg/ && apt-get autoremove --purge && apt-get clean


# Fix file permissions

RUN useradd -m -s /bin/bash manti
RUN chown -R manti:manti /srv/manti.by/ /var/log/manti.by/ /var/log/supervisor/ /var/run/


# Start app services

CMD supervisord -n -c /etc/supervisor/supervisord.conf