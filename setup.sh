#!/usr/bin/env bash

set -e

python3 -m venv .venv
.venv/bin/pip install -r requirements.txt

curl -#L https://github.com/SebastianSzturo/Dictionary-Development-Kit/archive/refs/heads/master.zip \
  | bsdtar -xf- -C ./ Dictionary-Development-Kit-master/bin
find Dictionary-Development-Kit-master/bin -type f -exec chmod +x {} \+
