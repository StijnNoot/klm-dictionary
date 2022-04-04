#!/usr/bin/env bash

set -e

source .env

rm -rf Dictionary
"${PYGLOSSARY_BIN-.venv/bin}/pyglossary" \
  KLM/dict.xdxf \
  Dictionary \
  --read-format=Xdxf \
  --write-format=AppleDict \
  --json-write-options='{ "front_back_matter": "front_back_matter.xml", "css": "Dictionary.css" }' \
  --utf8-check \
  --verbosity 3 \
  --no-progress-bar \
  --no-color
  

# Fixup
cp -v Dictionary.plist Dictionary/Dictionary.plist
VERSION=$(ggrep -Po '(?<=dict_edition\>)[^<]+' KLM/dict.xdxf)
for f in $(grep -r -l '{{VERSION}}' Dictionary)
do
  sed -i~ "s/{{VERSION}}/$VERSION/" "$f" && rm "$f~"
done
sed -i~ 's|<br/>\(<br/>\)*|<br/>|g' Dictionary/Dictionary.xml && rm Dictionary/Dictionary.xml~

SRC_DIR="${1-Dictionary}"
"${DICT_BUILD_TOOL_BIN?}/build_dict.sh" -e 1 -v 10.6 "${DICT_NAME}" "${SRC_DIR}"/Dictionary.xml "${SRC_DIR}"/Dictionary.css "${SRC_DIR}"/Dictionary.plist
