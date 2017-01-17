#!/bin/bash
set -e

export "PORT=${MAMUTE_PORT}"

if [ $# -eq 0 -o "${1:0:1}" = '-' ]; then
    set -- './setup.sh' "$@"
fi

exec "$@"
