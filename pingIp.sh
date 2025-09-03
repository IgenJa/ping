#!/bin/bash

#set
IP="10.254.0.1"
DEV="dummy0"

#create dummy
setup_interface() {
    if ! ip link show "$DEV" &>/dev/null; then
        sudo ip link add "$DEV" type dummy
    fi
    if ! ip addr show dev "$DEV" | grep -q "$IP"; then
        sudo ip addr add "$IP"/32 dev "$DEV"
    fi
    sudo ip link set "$DEV" up
}

turn_off() {
    setup_interface
    #no duplicate
    sudo iptables -D INPUT -d "$IP" -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable 2>/dev/null

    sudo iptables -A INPUT -d "$IP" -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable
    echo "$IP is now OFF (unreachable)"
}

#ping
turn_on() {
    setup_interface
    sudo iptables -D INPUT -d "$IP" -p icmp --icmp-type echo-request -j REJECT --reject-with icmp-host-unreachable 2>/dev/null
    echo "$IP is now ON (responding to ping)"
}

#check params
case "$1" in
    on)
        turn_on
        ;;
    off)
        turn_off
        ;;
    *)
        echo "Usage: $0 {on|off}"
        exit 1
        ;;
esac
