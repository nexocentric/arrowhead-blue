#!/bin/bash -u

function pause {
	read -p "$*"
}

function outputDebugInfo {
	if [[ -n $DEBUG_MODE_SET ]]; then
		echo $1
		pause "Press any key to continue execution."
	fi
}