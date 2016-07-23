# Contributing to the senseBox and openSenseMap resources

We appreciate any contributions to our documentational resources!
This includes improvements and corrections to existing content, as well as new content.

If you are unfamiliar with the GitHub process; there's a guide on adding your own senseBox project documentation [here](edu/en/contributing.md) (english) and [here](edu/de/eigene_projekte.md) (german)!

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
gitbook pdf de    # build the pdf for each language
gitbook pdf en
gitbook epub de   # build the ebook for each language
gitbook epub en
```

**Thank you for your contribution!**
