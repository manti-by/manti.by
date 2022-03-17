Manti.by
========


About
-----

Custom blog engine for music and photo publishing.

[![License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/manti-by/Manti.by/master/LICENSE)

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/manti.by

Requirements:

    Rust/Rocket, Nginx


Setup dev environment
---------------------

1. Install [Rust](https://www.rust-lang.org/tools/install)

2. Get [FFMpeg](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu), compile and install

        $ sudo apt install -y autoconf automake build-essential cmake git-core libtool \
            libass-dev libfreetype6-dev libmp3lame-dev libtheora-dev libvorbis-dev \
            pkg-config texinfo zlib1g-dev yasm
            
        $ mkdir -p $HOME/usr/ffmpeg/ && \
            wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
            tar xjvf ffmpeg-snapshot.tar.bz2 -C $HOME/usr/ffmpeg/
        
        $ export PATH="$HOME/bin:$PATH" && export PKG_CONFIG_PATH="$HOME/usr/ffmpeg/build/lib/pkgconfig"
        $ ./configure \
            --prefix="$HOME/usr/ffmpeg/build" \
            --pkg-config-flags="--static" \
            --extra-cflags="-I$HOME/usr/ffmpeg/build/include" \
            --extra-ldflags="-L$HOME/usr/ffmpeg/build/lib" \
            --extra-libs="-lpthread -lm" \
            --bindir="$HOME/bin" \
            --enable-libmp3lame \
            --enable-libtheora \
            --enable-libvorbis \
            --enable-nonfree
        $ make -j4 && make install


Build and run app in dev mode
-----------------------------

1. Build binary app

        $ cd app/ && cargo build

5. Run local development server

        $ cd app/ && cargo run


Production setup
----------------

1. Install [Nginx](https://ubuntu.com/tutorials/install-and-configure-nginx)

2. Link nginx config (TBU)

3. Create system service (TBU)
