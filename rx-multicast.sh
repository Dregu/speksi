#!/bin/bash
gst-launch-1.0 -e -v udpsrc multicast-iface=eth0 address=224.1.0.1 auto-multicast=true port=6666 caps="application/x-rtp,media=(string)video,payload=(int)96,clock-rate=(int)90000,encoding-name=(string)H264" ! rtph264depay ! h264parse ! avdec_h264 ! autovideosink sync=false
