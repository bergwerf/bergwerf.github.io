#!/bin/bash

function build {
  cat README.md | pandoc --columns 1000 --template index_template.html > index.html
}

function favicon {
  convert \
    -background none \
    -density 300 \
    -define "icon:auto-resize=256,128,96,64,48,32,16" \
    fig/Smiley.svg favicon.ico
}

build

if [ "$1" = "favicon" ]; then
  favicon
fi

if [ "$1" = "watch" ]; then
  inotifywait -qr -m README.md -e modify |
    while read directory action file; do
      echo "$action $directory$file"
      build
    done
fi
