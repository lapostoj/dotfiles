#!/usr/bin/env bash
set -o errexit # alias set -e
set -o nounset # alias set -u
set -o pipefail

# Allow running the script in debug mode with > TRACE=1 ./script.sh
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

# Write you script
