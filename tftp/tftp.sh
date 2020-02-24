#! /bin/bash

mountPath="$1"

# if length of $1 == 0
if [ -z "$1" ]; then
    # No argument supplied
    mountPath="$(pwd)"
fi

docker run \
    -p 0.0.0.0:69:69/udp \
    -v "${mountPath}:/var/tftpboot" \
    -i \
    -t tftp
