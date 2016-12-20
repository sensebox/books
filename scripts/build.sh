#!/usr/bin/env bash
set -e

# builds the website & pdf versions of all books into ./dist/

# create dist folder
rm -rf dist
mkdir dist

# build gitbooks
for d in */; do
	if [[ $d == 'edu/' ]] || [[ $d == 'home/' ]] || [[ $d == 'osem/' ]]; then
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
