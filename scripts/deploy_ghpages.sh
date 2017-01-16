#!/usr/bin/env bash
set -euo pipefail

rev=$(git rev-parse --short HEAD)
branch=$(git symbolic-ref --short -q HEAD)
bookname=${branch#book_}

# avoid ghpages magic
touch .nojekyll

# push build results to gh-pages
git checkout gh-pages
git config user.name "Travis-CI"
git config user.email "travis@travis-ci.org"
git add -f --ignore-errors *.pdf $bookname/*
git commit --amend -m "update build from $branch at $rev"
git push -f https://$GH_TOKEN@github.com/sensebox/books.git gh-pages
