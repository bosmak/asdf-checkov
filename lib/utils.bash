#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="checkov"
TOOL_TEST="checkov --help"

curl_opts=(-fsSL)

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl "${curl_opts[@]}" "https://pypi.org/pypi/${TOOL_NAME}/json" |
    jq -r '.releases | to_entries[] | .key'
}

download_release() {
  local version="$1"

  echo "* Downloading $TOOL_NAME release $version..."
  pip3 download --dest "$ASDF_DOWNLOAD_PATH" "${TOOL_NAME}==${version}" ||
    fail "Could not download $TOOL_NAME $version"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    cd "$plugin_dir"
    pip3 install --target="$install_path" "${TOOL_NAME}==${version}" ||
      fail "Could not install $TOOL_NAME $version"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
