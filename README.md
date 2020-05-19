# Useful Code Snippets and Software or Configuration Instructions

<p align="center">
<a href="https://github.com/ldsands/UsefulCodeSnippets/blob/master/LICENSE"><img src="https://img.shields.io/github/license/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<img src="https://img.shields.io/github/repo-size/ldsands/UsefulCodeSnippets?style=flat-square"></img>
<img src="https://img.shields.io/github/languages/count/ldsands/UsefulCodeSnippets?style=flat-square"></img>
<a href=""><img src="https://img.shields.io/github/languages/top/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<a href="https://github.com/ldsands/UsefulCodeSnippets/graphs/commit-activity"><img src="https://img.shields.io/github/commit-activity/m/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<a href="https://github.com/ldsands/UsefulCodeSnippets/commits/master"><img src="https://img.shields.io/github/last-commit/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<a href="https://github.com/ldsands/UsefulCodeSnippets/issues?q=is%3Aopen+is%3Aissue"><img src="https://img.shields.io/github/issues-raw/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<a href="https://github.com/ldsands/UsefulCodeSnippets/issues?q=is%3Aissue+is%3Aclosed"><img src="https://img.shields.io/github/issues-closed/ldsands/UsefulCodeSnippets?style=flat-square"></img></a>
<a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg?style=flat-square"></a>
<p>

This is a collection of useful code snippets that I either use frequently or I thought would be useful for the future.

For a list of todo items for me to add see [this file](Progress_Todo.md)

If you want me to add anything to this please create an issue or pull request if you know what you want to add

Table of Contents:

- [Useful Code Snippets and Software or Configuration Instructions](#useful-code-snippets-and-software-or-configuration-instructions)
    - [Languages included here](#languages-included-here)
        - [dotnet](#dotnet)
        - [Julia](#julia)
        - [Markdown](#markdown)
        - [Python](#python)
        - [R](#r)
        - [RegEx](#regex)
    - [Other snippets and instructions](#other-snippets-and-instructions)
        - [Bash](#bash)
        - [Git](#git)
        - [Github](#github)
        - [Pandoc](#pandoc)
        - [Powershell](#powershell)
        - [VS Code stuff](#vscode-stuff)
        - [Windows](#windows)

## Languages included here

### [dotnet](https://dotnetfoundation.org/)

.Net Standard (I'll just use dotnet for ease of use and understanding) is the platform for the majority of Microsoft's official development languages and tools. It includes powershell, c#, f# and others. I primarily use it for powershell and c#. I use c# specifically to do anything that is slow in python since c# is a complied language.

- [dotnet installation and overview](programming_languages/dotnet/dotnet_install_overview.md)
- C# or Csharp
    - [Csharp Intro](programming_languages/dotnet/csharp/csharp_intro.md)
    - [Csharp useful commands](programming_languages/dotnet/csharp/csharp_useful_snippits.md)
- F# or FSharp
    - [FSharp intro](programming_languages/dotnet/fsharp/fsharp_intro.md)
    - [FSharp useful commands](programming_languages/dotnet/fsharp/fsharp_useful_snippits.md)

### [Julia](https://julialang.org/)

Julia is a high level JIT compiled language which allows for python like syntax (i.e. easy to read and learn) but with a bit of tweaking similar speeds to complied languages such as C or C++.

- [Julia installation and overview](programming_languages/julia/julia_install_overview.md)
- [Julia useful commands and code](programming_languages/julia/julia_useful_commands.md)

### [Markdown](https://github.github.com/gfm/)

Markdown is a markup language like HTML but is incredibly simple and very powerful particularly in combination with something like Pandoc.

- [Useful resources](programming_languages/markdown/markdown_resources.md)
- [Useful commands](programming_languages/markdown/markdown_commands.md)

### [Python](https://www.python.org/)

Python is a general purpose scripting language that because of its popularity has many other frameworks with Python wrapper code to allow for use in Python.

- [Python installation notes and links](programming_languages/python/python_install.md)
- [Python useful commands](programming_languages/python/python_commands.md)
- [Python useful modules](programming_languages/python/python_modules.md)
- [Pandas useful commands](programming_languages/python/pandas_commands.md)

### [R](https://www.r-project.org/)

R is a programming language that was written for statisticians by statisticians. This origin show as R is very easy to learn and powerful for basic stats and data manipulation. It is also really bad at doing pretty much anything else.

- [Useful resources and installation](programming_languages/R/r_resources.md) Note: this has not yet been started <!-- TODO: -->
- [Useful packages](programming_languages/R/r_useful_packages.md)

### [RegEx](https://en.wikipedia.org/wiki/Regular_expression)

RegEx (regular expression) is used to match text once you learn a little bit of it it is very useful.

- [Useful RegEx commands](programming_languages/regex/regex.md)

<!-- ### [Stata](https://www.stata.com/)

Stata commands, resources and notes that I've found useful -->

## Other snippets and instructions

There are other software based snippets or instructions that I will keep here as well

### [Bash](https://www.gnu.org/software/bash/)

Bash is the most widely used shell for Linux. I use it mostly in WSL. Also note that I usually use zsh not bash it has a lot of useful plugins but they're very similar.

- [Useful bash commands](other_software/bash.md)

<!-- ### [Docker](https://www.docker.com/)

- [Docker install, resources, and commands](https://www.docker.com/) -->

### [Git](https://git-scm.com/)

Git is a software management software that allows you to track changes made to files. A key benefit of this is the ability to keep all of your old versions of files without having to manage the storage and organization of those old versions.

- [Useful Git Commands](other_software/git.md)

### [Github](https://github.com/)

GitHub is an online site devoted to hosting files using git based track changes.

- [GitHub Resources and Tips](other_software/GitHub.md)

### [Pandoc](https://pandoc.org/)

Pandoc is software that converts many different kinds of documents into any one of another large number of document types.

- [Useful Pandoc commands](other_software/pandoc_commands.md)

### [Powershell](https://docs.microsoft.com/en-us/powershell/)

PowerShell is like bash but for Windows and now with access to all of .Net it is pretty much a full fledged programming language.

- [Useful Powershell commands](other_software/powershell.md)

### [VS Code stuff](https://code.visualstudio.com/)

Visual Studio Code is technically a text editor but really is a full blown IDE (integrated development environment) for most programming languages. I use it for pretty much everything to do with programming. I also use it for note-taking and various other tasks.

- [Useful VS Code Resources and Notes](other_software/VS_Code/vscode.md)
- [Useful VS Code Resources and Notes](other_software/VS_Code/vscode.md)
- [Useful VS Code Extensions](other_software/VS_Code/vscode_extensions.md)
- [Useful VS Code Settings](other_software/VS_Code/vscode_settings.md.md)

### [Windows](https://www.microsoft.com/en-us/windows)

- [AutoHotKey - for automating small things in Windows](other_software/windows_program_instructions/autohotkey.md)
- [Chocolatey - for installing applications and languages etc. in Windows](other_software/windows_program_instructions/chocolatey.md)
- [Windows Programs - notes about other Windows programs I use regularly](other_software/windows_program_instructions/windows_programs.md)
- [Zotero - a free and open source reference manager](other_software/windows_program_instructions/zotero.md)
