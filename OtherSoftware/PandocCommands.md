# Pandoc Useful Commands

- [Pandoc Useful Commands](#pandoc-useful-commands)
    - [Installation](#installation)
    - [Basic commands and conversion](#basic-commands-and-conversion)
    - [Using citeproc (for citations)](#using-citeproc-for-citations)
    - [LaTeX Tips](#latex-tips)
    - [Other Formatting Tricks](#other-formatting-tricks)
    - [YAML Commands](#yaml-commands)
    - [Lua filters](#lua-filters)

## Installation

- On Manjaro (Arch Linux) you can use yay to install pandoc and other related software.

    ```sh
    yay -S pandoc texlive-core texlive-latexextra texlive-fontsextra
    ```

## Basic commands and conversion

Example 1: convert markdown doc to word doc

- The code example below does the following
    - `pandoc` command opens the Pandoc program
    - `-o` is the output command after the -o write the name of the file you want to write
    - `-f` is the from command so you can convert from some form in this case markdown
    - `-t` is the to command which tells pandoc what format to convert the file to in this case docx
    - Finally the filename.md is the file that is used as the input
    - This order is not important however there are other commands whose order do matter

    ```pandoc
    pandoc -o output.docx -f markdown -t docx filename.md
    ```

Example 2: convert from markdown to html

1. the code example below does the following
    1. pandoc calls pandoc
    1. paper_draft.md is the input file
    1. -t means to what format thus here it is docx
    1. -o means the output file or here EPLS_6209_SP2020_Draft_Levi_Sands.docx
    1. --reference-doc=pandoc_stuff/reference_mod.docx uses another word document as a reference to use the styles that had been modified by me
    1. --filter pandoc-citeproc this has to be at the end it uses the information from the yaml header for the source for references and csl for the formatting of the references

    ```pandoc
    pandoc paper_draft.md -t docx -o EPLS_6209_SP2020_Draft_Levi_Sands.docx --reference-doc=pandoc_stuff/reference_mod.docx --filter pandoc-citeproc
    ```

Other useful conversion command notes

- To use some settings that are used frequently can be removed from the markdown file's `yaml` header and moved to another `yaml` file with this command

    ```sh
    pandoc TestDoc.md -t docx -o TestDoc.pdf --defaults=pandoc_stuff/defaults.yaml
    ```

    - Or you can put this at the top of the target document's `yaml` header

        ```yaml
        defaults: pandoc_stuff/default.yaml
        ```

    - This is what I usually put into my `defaults.yaml` file

        ```yaml
        # Pandoc Conversion Command Options
        from: markdown
        to: pdf
        pdf-engine: xelatex
        # lua filters (not working with defaults.yaml)
        filters:
          - pandoc_stuff/center.lua
        metadata-file: pandoc_stuff/meta.yaml
        # Reference Metadata
        bibliography: pandoc_stuff/bib.bib
        csl: pandoc_stuff/american-sociological-association-levi
        citeproc: true
        cite-method: citeproc
        ```

    - Note: I cannot seem to get this working with lua filters

## [Using citeproc (for citations)](https://pandoc.org/MANUAL.html)

See example 2 above for the pandoc command for citeproc, see the yaml commands below for the yaml examples needed for citeproc (bibliography and csl lines are needed), for the link above look for the "Citation rendering" and "Ciations" headings for more details

below are examples of the commands that you need to use to effectively use citeproc in markdown documents

- The @citiation_header will cite the item that is from the bib file linked in the yaml header
- The [] on either side will put it into parentheses
- A ";" is needed inbetween each unique citation
- Below is also an example of added page numbers it will figure out based the csl file you use how to format it
- @Thoits_2011 will do author(s) followed by year in parentheses
- The -@Thoits_2011 will "suppresses" the author(s) and just show the year in parentheses
- The # References creates a bibliography below that heading (must be at the end of the document)
    - There was a recent update that allows you to move the bibliography to where ever you want when you use this code `<div id="refs"></div>` this is very useful when you need to add appendices after your bibliography

```pandoc
Markdown text here [@citiation_header1; @citation_header2 pp. 240-320]. @Thoits_2011 Thoits -@Thoits_2011 say blah in her article.


# References
```

## LaTeX Tips

- To apply some special formatting to text using LaTeX you can do the following:

    ```yaml
    # you till need the code below in the `yaml` header
    header-includes: |
      \usepackage {xcolor}
      \newcommand\BoldBlue[1]{\textbf{\textcolor{blue}{#1}}}
      \newcommand\BoldRed[1]{\textbf{\textcolor{red}{#1}}}
      \newcommand\ColorBlue[1]{\textcolor{blue}{#1}}
      \newcommand\ColorRed[1]{\textcolor{red}{#1}}
    ```

    ```pandoc
    # the ! is only to display here in the markdown do not use it in the pandoc document
    !```{=latex}
    \textbf{\ColorRed{AWESOME}}
    !```
    ```

- To use a lua filter to create a LaTeX environment you can look [here](https://tex.stackexchange.com/a/526036)

## Other Formatting Tricks

- You can include any raw language (be careful about what you can or want to process)
    - For example you can open xml to modify word documents this example below adds a pagebreak directly to a word document (since it uses open xml)
    - You can also set these up through [lua filters](#lua-filtershttpsgithubcompandoclua-filters)
        - This is probably a better option but a bit more complicated
    - Note: with the code below there is a "-" before the three grave accent keys you need you must not use the "-" it is used here due to formatting issues

    ```pandoc
    ```{=openxml}
    <w:p><w:r><w:br w:type="page"/></w:r></w:p>
    -```
    ```

- A pagebreak when creating `pdf` files is done with: `\pagebreak`

## YAML Commands

for the beginning of the document add this to add a yaml header included are some inclusions that I usually use (linux version)

```yaml
---
# Document Settings
link-citations: yes
pagesize: letter
# I can't get this to work with FiraSans
# mainfont: FiraSans
# mainfontoptions:
# - Extension=.otf
# - UprightFont=*
# - BoldFont=*-Bold
# - ItalicFont=*-Italic
# - BoldItalicFont=*-BoldItalic
# mainfont: /usr/share/fonts/OTF/FiraSans-Regular.otf
# mainfontoptions:
#   - BoldFont=/usr/share/fonts/OTF/FiraSans-Bold.otf
#   - ItalicFont=/usr/share/fonts/OTF/FiraSans-Italic.otf
#   - BoldItalicFont=/usr/share/fonts/OTF/FiraSans-BoldItalic.otf
# mathfont: /usr/share/fonts/OTF/FiraMath-Medium.otf
fontfamily: arev # a sans serif font that I like it requires texlive-fontsextra installed
fontsize: 11pt
geometry: margin=1in
linestretch: 2
indent: true
# Document Metadata
title: SOC:1030:0EXW | Summer 2021 | 8 Week Session
# date: "March 2021"
# author:
#   - "Levi Sands^[Department of Sociology and Criminology, University of Iowa]"
# for the vs code extension
bibliography: [pandoc_stuff/bib.bib]
---
```

For Windows use these font lines in the YAML file

```yaml
mainfont: FIRASANS-Regular.OTF
mainfontoptions:
  - BoldFont=FIRASANS-BOLD.OTF
  - ItalicFont=FIRASANS-ITALIC.OTF
  - BoldItalicFont=FIRASANS-BOLDITALIC.OTF
mathfont: FIRAMATH-REGULAR.OTF
```

## [Lua filters](https://github.com/pandoc/lua-filters)

- Lua filters are for adding functionality to pandoc on your own. See the [formatting tricks](#other-formatting-tricks) section for more details
    - The command for this must (as far as I can tell) be included in the conversion command (shown below).

        ```sh
        --lua-filter=pandoc_stuff/center.lua
        ```

- A list of lua filtered can be found [here](https://github.com/jgm/pandoc/wiki/Pandoc-Filters).

- A multi column filter can be found [here](https://github.com/jdutant/columns). An example of how to use it is below.

    ```markdown
    ::: {.columns column-count=2}

    Test content column 1

    \columnbreak

    Test content column 2

    :::
    ```
