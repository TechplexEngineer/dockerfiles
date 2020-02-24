#! /bin/bash

# ==============================================================================
# Use this script to easily start a tftp server container.
# When no args are passed, the current directory will be served by the tftp server
# Optionally pass a path to serve as the first argument.
# ==============================================================================

mountPath="$1"

# if length of $1 == 0
if [ -z "$1" ]; then
    # No argument supplied
    mountPath="$(pwd)"
fi

echo "Starting TFTP server at ${mountPath}"
echo "Type CTRL-C to stop"

docker run \
    -p 0.0.0.0:69:69/udp \
    -v "${mountPath}:/var/tftpboot" \
    -i \
    -t \
    "$USER/tftp"
