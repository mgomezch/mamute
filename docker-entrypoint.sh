#!/bin/bash
set -e

if [ -o "${1:0:1}" = '-' ]; then
    set -- './setup.sh' "$@"
fi

exec "$@"
