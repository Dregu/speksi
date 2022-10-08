#!/bin/bash
gst-launch-1.0 -v -e uvch264src device=/dev/video0 initial-bitrate=3000000 average-bitrate=3000000 auto-start=true iframe-period=3000 rate-control=cbr fixed-framerate=true name=src src.vidsrc ! \
  video/x-h264,profile=main,width=1920,height=1080,framerate=30/1 ! h264parse !\
    rtph264pay mtu=3072 pt=96 config-interval=1 ! udpsink auto-multicast=true host=224.1.0.1 port=6666 sync=false
