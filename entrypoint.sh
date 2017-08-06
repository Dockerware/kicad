#!/usr/bin/env bash

set -e

RUNUSER_UID="${RUNUSER_UID:-1000}"

if [ "${RUNUSER_UID}" != "$(id -u creator)" ]; then
    usermod -u "${RUNUSER_UID}" creator
    groupmod -g "${RUNUSER_UID}" creator
    usermod -g "${RUNUSER_UID}" creator
fi

chown creator:creator -R /home

exec su --login creator --command kicad "$@" >/dev/null 2>&1
