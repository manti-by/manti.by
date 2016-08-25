#!/bin/sh
ffmpeg -i $1 -acodec libmp3lame -t 1800 -ac 1 -ab 96k -ar 44100 -af "afade=t=out:st=1770:d=30" $2