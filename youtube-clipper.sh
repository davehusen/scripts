#!/bin/bash

set -x

# required inputs
LINK="$1"
START="$2"
END="$3"
OUTPUT_FILE="$4"

# CHANGE ME!
OUT_DIR="/Users/dhusen/Desktop/halloween-clips"

# temp storage for downloaded clip
TMP_FILE="/tmp/zzzTemp-$OUTPUT_FILE"

# required binaries
youtubedl=$(which youtube-dl)
ffmpeg=$(which ffmpeg)

# usage function
usage () {
        echo "usage: $0 youtube_link start_time end_time output_filename"
        echo "All times should be formatted as HH:MM:SS (ex: 00:01:40 for 1 minute and 40 seconds)."
  }

if [ ! $# == 4 ]; then
  usage
  exit 1
fi

# download the clip
"$youtubedl" -f 22 "$LINK" -o "$TMP_FILE.mp4"

# trim the clip
"$ffmpeg"  -i "$TMP_FILE.mp4" -ss ""$START".00" -to ""$END".00"  ""$OUT_DIR/$OUTPUT_FILE".mp4"
