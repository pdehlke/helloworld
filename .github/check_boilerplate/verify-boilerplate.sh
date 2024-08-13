#!/usr/bin/env bash

# --------------------------------------------------------------------------
# Copyright (c) 2022 by Above Property, LLC. All rights reserved.
# --------------------------------------------------------------------------

set -eo pipefail

echo "Verifying AP Copyright boilerplate"

if [[ -z "$(command -v python)" ]]; then
  echo "Cannot find python. Make link to python3..."
  update-alternatives --install /usr/bin/python python /usr/bin/python3 1
fi

TOOLS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Directory to check. Default is the base of the repo.
ROOT="${1:-${TOOLS%%/.github/check_boilerplate}}"
boiler="${TOOLS}/boilerplate.py"

mapfile -t files_need_boilerplate < <("${boiler}" --rootdir="${ROOT}" --verbose ${FILES})

if [[ ${#files_need_boilerplate[@]} -gt 0 ]]; then
  for file in "${files_need_boilerplate[@]}"; do
    echo "Boilerplate header is wrong for: ${file}"
  done
  exit 1
fi

echo "Done"
exit 0
