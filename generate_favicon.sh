#!/bin/bash

convert \
  -background none \
  -density 300 \
  -define "icon:auto-resize=256,128,96,64,48,32,16" \
  fig/Smiley.svg favicon.ico
