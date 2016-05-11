#!/bin/sh
ffmpeg -i $1 -acodec libvorbis -ab 320k $2