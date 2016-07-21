#!/bin/bash

TSIG=$(dd if=/dev/random of=/dev/stdout count=1 bs=32 | base64)

sed -e "s,{{ SECRET }},${TSIG}," secret.keys.template > secret.keys
