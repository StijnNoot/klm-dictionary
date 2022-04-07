#!/usr/bin/env bash

set -e

source .env

last_edited_date=$(date -r KLM/dict.xdxf '+%d-%m-%Y')
last_edited_date_full=$(date -r KLM/dict.xdxf -u)
VER_DESCRIBE=$(git describe --tags --dirty --long --match 'v[0-9]*' | sed 's/-/ /' | sed 's/^v//')
VERSION=v$(($(echo "$VER_DESCRIBE" | cut -d' ' -f 1) + 1))+$(echo "$VER_DESCRIBE" | cut -d' ' -f 2)

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
for f in $(grep -r -l '{{VERSION}}' Dictionary)
do
  sed -i~ "s/{{last_edited_date}}/$last_edited_date/g" "$f" && rm "$f~"
  sed -i~ "s/{{last_edited_date_full}}/$last_edited_date_full/g" "$f" && rm "$f~"
  sed -i~ "s/{{VERSION}}/$VERSION/g" "$f" && rm "$f~"
done
sed -i~ 's|<br/>\(<br/>\)*|<br/>|g' Dictionary/Dictionary.xml && rm Dictionary/Dictionary.xml~

SRC_DIR="${1-Dictionary}"
"${DICT_BUILD_TOOL_BIN?}/build_dict.sh" -e 1 -v 10.6 "${DICT_NAME}" "${SRC_DIR}"/Dictionary.xml "${SRC_DIR}"/Dictionary.css "${SRC_DIR}"/Dictionary.plist

cd objects
mkdir -p target
mv KLM.dictionary target/
