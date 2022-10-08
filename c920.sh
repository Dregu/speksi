#!/bin/bash
gst-launch-1.0 -v -e uvch264src device=/dev/video2 initial-bitrate=1200000 average-bitrate=1200000 auto-start=true iframe-period=6000 rate-control=vbr fixed-framerate=true name=src src.vidsrc ! \
  video/x-h264,profile=constrained-baseline,width=1280,height=720,framerate=30/1 ! h264parse !\
    rtph264pay pt=126 config-interval=1 ! udpsink auto-multicast=true host=224.1.0.1 port=6666
