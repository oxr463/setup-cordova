#!/bin/sh
set -eu

CORDOVA="$(command -v cordova)"

"${CORDOVA}" "${1}"
