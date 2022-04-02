#!/usr/bin/env bash

set -e

source .env

"${DICT_BUILD_TOOL_BIN?}/build_dict.sh" -e 1 -v 10.6 "${DICT_NAME}" src/Dictionary.xml src/Dictionary.css src/Info.plist
