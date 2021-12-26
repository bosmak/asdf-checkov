#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for checkov.
GH_REPO="https://github.com/bridgecrewio/checkov"
TOOL_NAME="checkov"
TOOL_TEST="checkov --help"

curl_opts=(-fsSL)

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

print_file() {
  while read -r l || [ -n "${l}" ]; do
    echo "$l"
  done <${1}
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl ${curl_opts[@]} https://pypi.org/pypi/${TOOL_NAME}/json |
    jq -r '.releases | to_entries[] | .key'
}

install() {
  local type=$1
  local version=$2
  local path=$3

  # check install type
  if [ "$type" != "version" ]; then
    fail "only version installs are supported"
  fi

  if command -v pip3 >/dev/null; then
    echo "Installing ${TOOL_NAME} with pip3"
    pip3 install --target="${path}" ${TOOL_NAME}==${version}
  else
    fail "depdencies aren't met and the installation won't proceed"
  fi
}
