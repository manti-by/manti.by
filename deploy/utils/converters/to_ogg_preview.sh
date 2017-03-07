#!/bin/sh
ffmpeg -i $1 -acodec libvorbis -t 1800 -ac 1 -ab 96k -af "afade=t=out:st=1770:d=30" $2