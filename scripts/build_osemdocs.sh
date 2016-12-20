#!/usr/bin/env bash
set -e

# build the current openSenseMap API documentation
# and copy it into the osem book

wget https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_project.json
wget https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_data.json

apidoc-markdown -p ./ -t osem/apidoc-markdown_template.md -o osem/en/osem_api.md

cp -f osem/en/osem_api.md osem/de/osem_api.md
rm api_project.json api_data.json
