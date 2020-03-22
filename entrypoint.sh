#!/bin/sh -l
set -eu
echo "${@}"
/bin/sh -c "${1}"
