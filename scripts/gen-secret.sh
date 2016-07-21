#!/bin/bash

set -u
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <TSIG template file>"
fi

FILENAME=$1

TSIG=$(dd if=/dev/random of=/dev/stdout count=1 bs=32 | base64)

sed -e "s,{{ SECRET }},${TSIG}," $FILENAME
