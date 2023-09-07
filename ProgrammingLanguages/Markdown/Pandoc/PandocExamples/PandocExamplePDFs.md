---
# Document Metadata
title: Example Title
date: "June 2022"
abstract: |
  This is the abstract.

  It consists of two paragraphs.

  Note: add a \pagebreak here if you want to put the table of contents onto the next page

  \pagebreak
author:
  - "Levi Sands^[Department of Sociology and Criminology, University of Iowa]"
---

<!--
commands needed to use pandoc to convert the markdown file to a pdf
cd DirectoryContainingFile
pandoc "PandocExamplePDFs.md" -o "PandocExamplePDFs.pdf" --defaults=pandoc_stuff/defaults.yaml

# some latex for reference
```{=latex}
\textbf{\BoldRed{Learning Objectives:}}
```

```{=latex}
\textbf{\BoldRed{Due Dates:}}
```

```{=latex}
\textbf{\BoldBlue{This Week:}}
```

```{=latex}
\fbox{Related Course: Intro to Sociology (SOC:1010)}
```

# horizontal rule line
***
-->

\pagebreak

here is a code block

```python
import pathlib
```

```{=latex}
\textbf{\BoldRed{Learning Objectives:}}
\BoldRed{Learning Objectives:}
```

- Item 0001
- Item 0002
- Item 0003
- Item 0004
- Item 0005

```{=latex}
\BoldRed{Due Dates:}
```

- Item 0001
- Item 0002
- Item 0003
- Item 0004
- Item 0005

```{=latex}
\BoldBlue{This Week:}
```

- Item 0001:
    - Indented item 0001
    - Indented item 0002
    - Indented item 0003
    - Indented item 0004
    - Indented item 0005
- Item 0002:
    - Indented item 0001
    - Indented item 0002
    - Indented item 0003
    - Indented item 0004
    - Indented item 0005

```{=latex}
\fbox{Related Course: Intro to Sociology (SOC:1010)}
```

- Citation 0001 (@ashmoreOrganizingFrameworkCollective2004).
- Citation 0002 (@benfordFramingProcessesSocial2000; @benteleBreakingWallChurch2014).
- Citation 0003 -@bonillaFergusonDigitalProtest2015 this supresses the author (@bernsteinIdentityPolitics2005 pp. 240-320).
- Citation 0004 ().
- Citation 0005 ().
- Citation 0006 ().

<!-- # horizontal rule line -->
***

<!-- pagebreak for making pdfs -->
\pagebreak

::: {.center}

## Test Centered Text

## More Test Centered Text

:::

\pagebreak

<!-- this allows you to put the references anywhere but it will break the # References (at the end of the document) method of making a bibliography -->
<div id="refs"></div>

\pagebreak

# References

<div id="refs"></div>
