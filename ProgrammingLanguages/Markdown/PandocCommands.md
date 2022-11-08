# Pandoc Useful Commands

- [Pandoc Useful Commands](#pandoc-useful-commands)
    - [Installation](#installation)
    - [Basic commands and conversion](#basic-commands-and-conversion)
    - [Using citeproc (for citations)](#using-citeproc-for-citations)
    - [LaTeX Tips](#latex-tips)
    - [Other Formatting Tricks](#other-formatting-tricks)
    - [YAML Files](#yaml-files)
    - [Lua filters](#lua-filters)

## Installation

- On Manjaro (Arch Linux) you can use yay to install pandoc some fonts and other related software.

    ```sh
    # this installs fonts, pandoc, fontconfig, and a few texlive packages which allows for creating pdfs using pandoc
    yay -S ttf-ms-win11-auto pandoc fontconfig texlive-core texlive-latexextra texlive-fontsextra
    # or if you can install the full texlive which is much larger (over 7 gigs) and takes much longer to install
    yay -S ttf-ms-win11-auto pandoc texlive-full 
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
    1. -o means the output file or here Draft_Paper.docx
    1. --reference-doc=pandoc_stuff/reference_mod.docx uses another word document as a reference to use the styles that had been modified by me
    1. --citeproc this has to be at the end it uses the information from the yaml header for the source for references and csl for the formatting of the references

    ```pandoc
    pandoc paper_draft.md -t docx -o Draft_Paper.docx --reference-doc=pandoc_stuff/reference_mod.docx --filter pandoc-citeproc
    ```

Other useful conversion command notes

- To use some settings that are used frequently can be removed from the markdown file's `yaml` header and moved to another `yaml` file(s) with this command. More information can be found [here](https://pandoc.org/MANUAL.html#defaults-files).

    ```sh
    pandoc TestDoc.md -t docx -o TestDoc.pdf --defaults=pandoc_stuff/defaults.yaml
    ```

    - Or you can put this at the top of the target document's `yaml` header though I've haven't been able to get this to work with the `meta.yaml` reference I use in the `defaults.yaml`

        ```yaml
        defaults: pandoc_stuff/defaults.yaml
        ```

    - This is what I usually put into my `defaults.yaml` file, which as shown below works with `meta.yaml`

        ```yaml
        # Pandoc Conversion Command Options
        from: markdown
        to: pdf
        pdf-engine: xelatex
        # lua filters
        filters:
          - pandoc_stuff/center.lua
        # metadata-file which contains the styling options
        metadata-file: pandoc_stuff/meta.yaml
        # Reference Metadata
        citeproc: true
        metadata:
          bibliography: pandoc_stuff/bib.bib
          csl: pandoc_stuff/american-sociological-association-levi
        ```

    - `meta.yaml` is more for formatting stuff below is what I use which works with the above options used in the `defaults.yaml`

        ```yaml
        # Document Settings
        colorlinks: true
        fontsize: 11pt
        geometry: margin=1in
        indent: true
        linestretch: 1 # 1 for single spacing or 2 for double spacing
        link-citations: yes
        # mainfont: Arial
        # mainfont: Calibri
        # mainfont: Comic Sans MS
        # mainfont: Consolas
        # mainfont: Courier New
        # mainfont: DejaVu Sans
        # mainfont: DejaVu Serif
        # mainfont: Droid Sans
        # mainfont: Droid Serif
        # mainfont: Fira Sans
        # mainfont: Georgia
        # mainfont: Impact
        # mainfont: Liberation Mono
        # mainfont: Liberation Sans
        # mainfont: Liberation Serif
        # mainfont: Noto Sans
        mainfont: Segoe UI
        # mainfont: Times New Roman
        # mainfont: Trebuchet MS
        # mainfont: Verdana
        pagesize: letter
        toc: true # table of contents
        header-includes: |
          \usepackage {xcolor}
          \newcommand\BoldBlue[1]{\textbf{\textcolor{blue}{#1}}}
          \newcommand\BoldRed[1]{\textbf{\textcolor{red}{#1}}}
          \newcommand\ColorBlue[1]{\textcolor{blue}{#1}}
          \newcommand\ColorRed[1]{\textcolor{red}{#1}}
          \usepackage{framed}
        ```

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
      \usepackage{framed}

    ```

    ```pandoc
    # the ! is only to display here in the markdown do not use it in the pandoc document
    # this turns the text red while the BoldRed bolds the text and turns it red without needing \textbf{}
    !```{=latex}
    \textbf{\ColorRed{AWESOME}}
    \BoldRed{Learning Objectives:}
    !```

    # this below puts a box around the text
    !```{=latex}
    \begin{framed}
    Related Course: Social Inequality (SOC:2810)

    Related Minor: Political Science

    Related Job Titles: Case Worker, Director of a Non-Profit, Tax Preparer, Financial Planner, Homeless Shelter Director
    \end{framed}
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

## YAML Files

for the beginning of the document add this to add a yaml header included are some inclusions that I usually use (linux version)

```yaml
---
# Document Settings
link-citations: yes
pagesize: letter
# You can get a list of installed fonts by installing fontconfig then using `fc-list` you may need to use the `fc-cache -fv` command to refresh the list of installed fonts before some of the fonts listed below are seen by the system
mainfont: Fira Sans
# mainfontoptions:
# - Extension=.otf
# - UprightFont=*
# - BoldFont=*-Bold
# - ItalicFont=*-Italic
# - BoldItalicFont=*-BoldItalic
# mainfontoptions:
#   - BoldFont=/usr/share/fonts/OTF/FiraSans-Bold.otf
#   - ItalicFont=/usr/share/fonts/OTF/FiraSans-Italic.otf
#   - BoldItalicFont=/usr/share/fonts/OTF/FiraSans-BoldItalic.otf
# mathfont: /usr/share/fonts/OTF/FiraMath-Medium.otf
fontfamily: arev # a sans serif font that I like it requires texlive-fontsextra installed and doesn't work well when using xelatex in combination with using the defaults and/or meta files
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
