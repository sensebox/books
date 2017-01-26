#!/usr/bin/env bash
set -euo pipefail

# builds the specified targets for a gitbook in the current directory.
# if no target (pdf|website) is specified, all are built.

function build_website {
    echo "building website into $bookname/"
    gitbook build
    rm -rf $bookname
    mv -f _book $bookname
}

function build_pdf {
    echo "building pdfs for $bookname"
    svgexport cover.svg cover.jpg
    gitbook pdf
    mv -f book_de.pdf senseBox:${bookname}_de.pdf
    mv -f book_en.pdf senseBox:${bookname}_en.pdf
}

branch=$(git symbolic-ref --short -q HEAD)
bookname=${branch#book_}
targets=$@

# build all targets if none is specified
if [[ -z $@ ]]; then
    targets="website pdf"
fi

gitbook install

for arg in $targets
do
    case $arg in
    -w|website)
        build_website ;;
    -p|pdf)
        build_pdf ;;
    *)
        echo "invalid target. try 'pdf' or 'website'" ;;
    esac
done
