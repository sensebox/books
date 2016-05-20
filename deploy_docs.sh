#!/usr/bin/env bash

# create dist
rm -rf dist
mkdir dist

# build gitbooks
for d in */; do
	if [[ $d != 'dist/' ]]; then
		echo cd into $d
		cd $d
		rm -rf _book
		gitbook build
		mkdir ../dist/$d
		cp -r _book/* ../dist/$d
		cd ../
	fi
done

# push to gh-pages
rev=$(git rev-parse --short HEAD)

cd dist
git init
git config user.name "mpfeil"
git config user.email "matthias.pfeil@wwu.de"
git add -A
git commit -m "update books at $rev"
git push -f https://$GH_TOKEN@github.com/sensebox/books.git master:gh-pages
