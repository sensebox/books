#!/bin/bash

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
    svgexport cover.svg cover.png
    convert -units PixelsPerInch cover.png -density 72 -page A4 cover.pdf
    gitbook pdf
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r300 \
      -sOutputFile=senseBox:${bookname}_de.pdf cover.pdf book_de.pdf
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r300 \
      -sOutputFile=senseBox:${bookname}_en.pdf cover.pdf book_en.pdf
    rm -f cover.pdf cover.png book_*.pdf
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
