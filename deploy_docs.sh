#!/usr/bin/env bash

# create dist
rm -rf dist
mkdir dist

# build gitbooks
for d in */; do
	if [[ $d != 'dist/' ]] || [[ $d != 'node_modules/' ]] || [[ $d != 'styles/' ]]; then
		echo cd into $d
		cd $d
		BOOKNAME_DE="senseBox:${d%/}_de.pdf"
		BOOKNAME_EN="senseBox:${d%/}_en.pdf"
		rm -rf _book $BOOKNAME_DE $BOOKNAME_EN
		gitbook install
		gitbook build
		gitbook pdf "de" $BOOKNAME_DE
		gitbook pdf "en" $BOOKNAME_EN
		mkdir ../dist/$d
		cp -r _book/* ../dist/$d
		cp $BOOKNAME_DE ../dist/
		cp $BOOKNAME_EN ../dist/
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
