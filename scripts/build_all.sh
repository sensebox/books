#!/usr/bin/env bash
set -euo pipefail

# builds the specified targets (website|pdf) of all books into the current directory

for branch in $(git for-each-ref "refs/heads/book_*" --format="%(refname:short)")
do
  git checkout $branch
  "`dirname $0`"/build.sh $@
done
