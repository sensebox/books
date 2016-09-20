#!/usr/bin/env bash

# build the current openSenseMap API documentation
# and copy it into the osem book
wget https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_project.json
wget https://raw.githubusercontent.com/sensebox/openSenseMap-API/gh-pages/api_data.json
apidoc-markdown -p ./ -t osem/apidoc-markdown_template.md -o osem/en/osem_api.md
cp -f osem/en/osem_api.md osem/de/osem_api.md

# create dist folder
rm -rf dist
mkdir dist

# build gitbooks
for d in */; do
	if [[ $d != 'dist/' ]] && [[ $d != 'node_modules/' ]] && [[ $d != 'styles/' ]]; then
		echo cd into $d
		cd $d
		rm -rf _book book_de.pdf book_en.pdf cover.jpg
		
		# build cover images from svg's (gitbook requires svgexport anyway, so...)
		svgexport cover.svg cover.jpg
		
		gitbook install
		gitbook build
		gitbook pdf
		mkdir ../dist/$d
		cp -r _book/* ../dist/$d
		cp book_de.pdf ../dist/senseBox:${d%/}_de.pdf
		cp book_en.pdf ../dist/senseBox:${d%/}_en.pdf
		cd ../
	fi
done

cp index.html dist/index.html

# push to gh-pages
rev=$(git rev-parse --short HEAD)

cd dist
git init
git config user.name "mpfeil"
git config user.email "matthias.pfeil@wwu.de"
git add -A
git commit -m "update books at $rev"
git push -f https://$GH_TOKEN@github.com/sensebox/books.git master:gh-pages
