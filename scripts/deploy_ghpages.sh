#!/bin/bash

repo=$(git config remote.origin.url)
rev=$(git rev-parse --short HEAD)
branch=$(git symbolic-ref --short -q HEAD)
bookname=${branch#book_}

git version
git status
echo TRAVIS_BRANCH: $TRAVIS_BRANCH
echo branch: $branch
echo rev: $rev
echo bookname: $bookname

# push build results to gh-pages
git clone --depth=1 -b gh-pages $repo deploy
mv -f *.pdf deploy/
cd deploy
git config user.name "Travis-CI"
git config user.email "travis@travis-ci.org"
git add -f --ignore-errors *.pdf # $bookname/*
git commit -m "update build from $branch at $rev" # --amend
git push -f https://$GH_TOKEN@github.com/sensebox/books.git gh-pages > /dev/null 2>&1
