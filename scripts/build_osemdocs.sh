#!/usr/bin/env bash
set -euo pipefail

# build the current openSenseMap API documentation
# and copy it into the osem book

wget https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_project.json \
     https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_data.json

apidoc-markdown -p ./ -t scripts/apidoc-markdown_template.md -o en/osem_api.md

cp -f en/osem_api.md de/osem_api.md
rm api_project.json api_data.json
