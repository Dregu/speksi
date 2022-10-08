#!/bin/bash

INT=eth0
#EXT=usb0
EXT=wlan0

systemctl stop dnsmasq
ip link set $INT up
ip addr add 10.20.0.2/24 dev $INT
systemctl restart dnsmasq

iptables -N fw-interfaces
iptables -N fw-open
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -j fw-interfaces
iptables -A FORWARD -j fw-open
iptables -A FORWARD -j REJECT --reject-with icmp-host-unreachable
iptables -P FORWARD DROP
iptables -A fw-interfaces -i $INT -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.20.0.0/24 -o $EXT -j MASQUERADE
sysctl net.ipv4.ip_forward=1
