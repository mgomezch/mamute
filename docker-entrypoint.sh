#!/bin/bash
set -e

export "PORT=${MAMUTE_PORT}"

if [ "${1:0:1}" = '-' ]; then
    set -- './setup.sh' "$@"
fi

exec "$@"
