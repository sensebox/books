# Contributing to the senseBox and openSenseMap resources

We appreciate any contributions to our documentational resources!
This includes improvements and corrections to existing content, as well as translations & entirely new content.

In case you are unfamiliar with the GitHub process; there's a guide on adding your own senseBox project documentation [here](edu/en/contributing.md) (english) and [here](edu/de/eigene_projekte.md) (german)!

**Thank you for your contribution!**

## Development environment
We use the node.js-based tool [GitBook](https://github.com/GitbookIO/gitbook) for the rendering of the content.

To live-preview or render a book, you need the npm package `gitbook-cli`.
Install it by running `npm i -g gitbook-cli`. If that does not work or you don't have `npm`, have a look at the [official documentation](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md).

### Live preview
To get a live preview of a books website-output, run
```
cd edu            # (or home, or osem)
gitbook install   # only required once
gitbook serve
```

### Render to disk
GitBook provides the output formats `website`, `pdf` and `ebook`.
To render a book run:
```
cd edu            # (or home, or osem)
gitbook install   # only required once

gitbook build     # build the website
gitbook pdf       # build the pdf
gitbook epub      # build the ebook
```

## Repository structure

Each (multilingual) book resides in its own subdirectory.
Currently these are `edu`, `home` and `osem`, each containing a `de` and `en` language book.

The german versions have far more content, while the english versions are steadily supplemented from there.

Files that are parsed specially by GitBook have a filename in caps:

- `LANGS.md`:  defines the languages of a multilingual book
- `README.md`: the landingpage of a book, eg an introduction
- `SUMMARY.md`: the table of contents, rendered as the left navbar
- `GLOSSARY.md`: a glossary, whose terms are referenced on all other book pages
- `FOOTER.md`: the page footer on any page

Stylesheets applied on all books are in `./styles`, and are symlinked into each book (unix only).

Currently, all BLOB files (except for community projects, see below) are hosted at a [separate repo](https://github.com/sensebox/resources), to improve reusability within our workinggroup.

### senseBox:edu community projects
Projects contributed by the community should be included in the book of their respective language, in the following directories:
```
edu/de/community_projekte/
edu/en/community_projects/
```

### gh-pages
The `gh-pages` branch contains the rendered output of the current state of `master`, automatically generated on a CI-server through the `.travis.yml` & `deploy_docs.sh` scripts.

This script also fetches and generates the current API documentation for the openSenseMap-API using `apidoc-markdown`.
