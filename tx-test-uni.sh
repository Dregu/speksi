#!/bin/bash
gst-launch-1.0 videotestsrc ! video/x-raw,width=1280,height=720,framerate=30/1 ! clockoverlay ! x264enc bitrate=2000 key-int-max=60 tune=zerolatency !\
  video/x-h264,profile=constrained-baseline,width=1280,height=720,framerate=30/1 ! h264parse !\
    rtph264pay pt=126 config-interval=1 ! udpsink host=10.0.0.148 port=6666 sync=false
