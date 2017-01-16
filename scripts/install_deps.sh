#!/usr/bin/env bash

set -euo pipefail

npm install -g "gitbook-cli" "svgexport" "github:RanzQ/node-apidoc-markdown"

# install calibre from github, needed for pdf build
sudo -v && wget -q -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
