#!/bin/bash
gst-launch-1.0 videotestsrc ! video/x-raw,width=1920,height=1080,framerate=30/1 ! clockoverlay ! vaapih264enc !\
    rtph264pay pt=126 config-interval=1 ! udpsink host=10.0.0.148 port=6666 sync=false
