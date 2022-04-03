#!/usr/bin/env bash

set -e

source .env

rm -rf Dictionary
"${PYGLOSSARY_BIN-.venv/bin}/pyglossary" KLMAbbreviations/dict.xdxf Dictionary --read-format=Xdxf --write-format=AppleDict

# Fixup
cp -v src/Dictionary.plist Dictionary/Dictionary.plist
#cp -v Dictionary.css Dictionary/Dictionary.css
sed -i~ 's|\(<h1>[^<]*</h1>\)|<div d:priority="2">\1</div>|g' Dictionary/Dictionary.xml

SRC_DIR="${1-Dictionary}"
"${DICT_BUILD_TOOL_BIN?}/build_dict.sh" -e 1 -v 10.6 "${DICT_NAME}" "${SRC_DIR}"/Dictionary.xml "${SRC_DIR}"/Dictionary.css "${SRC_DIR}"/Dictionary.plist
