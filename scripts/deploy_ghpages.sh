#!/usr/bin/env bash
set -e

cd dist

# push to gh-pages
rev=$(git rev-parse --short HEAD)

#cd dist
git init
git config user.name "mpfeil"
git config user.email "matthias.pfeil@wwu.de"
git add -A
git commit -m "update books at $rev"
git push -f https://$GH_TOKEN@github.com/sensebox/books.git master:gh-pages
