#!/usr/bin/env bash

if [[ "${1}" == "status" ]]; then
	if nordvpn status | grep -qi 'Status: Connected'; then
		loc=$(nordvpn status | grep "Current server:")
		loctrimmed=${loc:16:99}
		echo "$loctrimmed"
	else
		echo "vpn offline"
	fi

elif [[ "${1}" == "toggle" ]]; then
	if nordvpn status | grep -qi 'Status: Connected'; then
		nordvpn d
	else
		nordvpn c
	fi
fi
