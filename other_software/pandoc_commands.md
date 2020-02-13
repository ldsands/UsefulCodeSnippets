# Pandoc Useful Commands

## Basic commands and conversion

1. convert markdown doc to word doc TODO: needs to be improved
    1. cd Desktop
    1. ls
    1. pandoc -o output.docx -f markdown -t docx filename.md

to convert from markdown to html

1. get to directory
1. pandoc test.md -f markdown -t html -o test.html
    1. to explain the pandoc calls pandoc
    1. test.md is the input file
    1. -f designates from a  thus markdown here
    1. -t means to what format thus here it is html (or html5)
    1. -o means the output file or here test.html

## Using citeproc (for citations)

```pandoc
pandoc paper_draft.md -t docx -o test.docx --filter pandoc-citeproc
```

## other formatting tricks

1. you can include any raw language (be careful about what you can or want to process)
    1. e.g. you can open xml to modify word documents this example below adds a pagebreak directly to a word document (since it uses open xml)
    1. you can also set these up through [lua filters](#lua-filtershttpsgithubcompandoclua-filters)

    -```{=openxml}
    -<w:p><w:r><w:br w:type="page"/></w:r></w:p>
    -```


## Yaml commands

for the beginning of the document add this to add a YAML header included are some inclusions that I usually use

```yaml
---
title: Survey Methodology Rough Draft 1
date: 10 Feb 2020
author: "Levi Sands^[Department of Sociology and Criminology University of Iowa]"
bibliography: bib.bib
csl: american-sociological-association-levi.csl
...
```


## [Lua filters](https://github.com/pandoc/lua-filters)

Lua filters are for adding functionality to pandoc on your own. Above a link that 