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

For a list of todo items for me to add see [this file](ProgressTodo.md)

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
        - [Rust](#rust)
    - [Other snippets and instructions](#other-snippets-and-instructions)
        - [Bash/ZSH](#bashzsh)
        - [Manjaro](#manjaro)
        - [Git](#git)
        - [Github](#github)
        - [Pandoc](#pandoc)
        - [Powershell](#powershell)
        - [VS Code stuff](#vs-code-stuff)
        - [Windows](#windows)

## Languages included here

### [dotnet](https://dotnetfoundation.org/)

.Net Standard (I'll just use dotnet for ease of use and understanding) is the platform for the majority of Microsoft's official development languages and tools. It includes powershell, c#, f# and others. I primarily use it for powershell and c#. I use c# specifically to do anything that is slow in python since c# is a complied language.

- [dotnet installation and overview](ProgrammingLanguages/DotNet/DotNetInstallOverview.md)
- C# or CSharp
    - [CSharp Intro](ProgrammingLanguages/DotNet/CSharp/CSharpIntro.md)
    - [CSharp useful commands](ProgrammingLanguages/DotNet/CSharp/CSharpUsefulSnippits.md)
- F# or FSharp
    - [FSharp intro](ProgrammingLanguages/DotNet/FSharp/FSharpIntro.md)
    - [FSharp useful commands](ProgrammingLanguages/DotNet/FSharp/FSharpUsefulSnippits.md)

### [Julia](https://julialang.org/)

Julia is a high level JIT compiled language which allows for python like syntax (i.e. easy to read and learn) but with a bit of tweaking similar speeds to complied languages such as C or C++.

- [Julia installation and overview](ProgrammingLanguages/Julia/JuliaInstallOverview.md)
- [Julia useful commands and code](ProgrammingLanguages/Julia/JuliaUsefulCommands.md)

### [Markdown](https://github.github.com/gfm/)

Markdown is a markup language like HTML but is incredibly simple and very powerful particularly in combination with something like Pandoc.

- [Useful resources](ProgrammingLanguages/markdown/MarkdownResources.md)
- [Useful commands](ProgrammingLanguages/markdown/MarkdownCommands.md)

### [Python](https://www.python.org/)

Python is a general purpose scripting language that because of its popularity has many other frameworks with Python wrapper code to allow for use in Python.

- [Python installation notes and links](ProgrammingLanguages/Python/PythonInstall.md)
- [Python useful commands](ProgrammingLanguages/Python/PythonCommands.md)
- [Python useful modules](ProgrammingLanguages/Python/PythonModules.md)
- [Pandas useful commands](ProgrammingLanguages/Python/PandasCommands.md)
- [Xonsh](ProgrammingLanguages/Python/Xonsh.md) - This is a python based shell

### [R](https://www.r-project.org/)

R is a programming language that was written for statisticians by statisticians. This origin show as R is very easy to learn and powerful for basic stats and data manipulation. It is also really bad at doing pretty much anything else.

<!-- - [Installation notes](ProgrammingLanguages/R/RInstall.md) Note: this has not yet been started --> <!-- TODO: -->
<!-- - [Useful R Resources](ProgrammingLanguages/R/RResources.md) Note: this has not yet been started --> <!-- TODO: -->
- [Useful packages](ProgrammingLanguages/R/RUsefulPackages.md)

### [RegEx](https://en.wikipedia.org/wiki/Regular_expression)

RegEx (regular expression) is used to match text once you learn a little bit of it it is very useful.

- [Useful RegEx commands](ProgrammingLanguages/RegEx/RegEx.md)

<!-- ### [Stata](https://www.stata.com/)

Stata commands, resources and notes that I've found useful -->

### [Rust](https://rustlang.org/)

Rust is a programming language that is pretty much a C/C++ replacement that is by virtue of being so much newer avoids many of the pitfalls and annoyances that those languages have to deal with. I use it occasionally when I need to process data that is large enough that doing so in Python becomes impractical.

- [Rust installation notes and links](ProgrammingLanguages/Rust/RustInstall.md)
- [Rust useful commands](ProgrammingLanguages/Rust/RustCommands.md)
- [Rust useful modules](ProgrammingLanguages/Rust/RustModules.md)

## Other snippets and instructions

There are other software based snippets or instructions that I will keep here as well

### [Bash/ZSH](https://www.gnu.org/software/bash/)

Bash is the most widely used default shell for Linux. ZSH is an alternative that has a lot of quality of life improvements over bash. I use them mostly in WSL.

- [Useful bash commands](OtherSoftware/Linux/Bash.md)

### [Manjaro](https://manjaro.org/)

Manjaro (with KDE) is my preferred Linux distro. This file contains installation and setup instructions and tips.

- [Manjaro](OtherSoftware/Linux/Manjaro.md)

<!-- ### [Docker](https://www.docker.com/)

- [Docker install, resources, and commands](https://www.docker.com/) -->

### [Git](https://git-scm.com/)

Git is a software management software that allows you to track changes made to files. A key benefit of this is the ability to keep all of your old versions of files without having to manage the storage and organization of those old versions.

- [Useful Git Commands](OtherSoftware/Git.md)

### [Github](https://github.com/)

GitHub is an online site devoted to hosting files using git based track changes.

- [GitHub Resources and Tips](OtherSoftware/GitHub.md)

### [Pandoc](https://pandoc.org/)

Pandoc is software that converts many different kinds of documents into any one of another large number of document types.

- [Useful Pandoc commands](OtherSoftware/PandocCommands.md)

### [Powershell](https://docs.microsoft.com/en-us/powershell/)

PowerShell is like bash but for Windows and now with access to all of .Net it is pretty much a full fledged programming language.

- [Useful Powershell commands](ProgrammingLanguages/PowerShell/PowerShell.md)

### [VS Code stuff](https://code.visualstudio.com/)

Visual Studio Code is technically a text editor but really is a full blown IDE (integrated development environment) for most programming languages. I use it for pretty much everything to do with programming. I also use it for note-taking and various other tasks.

- [Useful VS Code Resources and Notes](OtherSoftware/VSCode/VSCode.md)
- [Useful VS Code Extensions](OtherSoftware/VSCode/VSCodeExtensions.md)
- [Useful VS Code Keyboard Shortcuts](OtherSoftware/VSCode/VSCodeKeyboardShortcuts.md)
- [Useful VS Code Settings](OtherSoftware/VSCode/VSCodeSettings.md)

### [Windows](https://www.microsoft.com/en-us/windows)

- [AutoHotKey - for automating small things in Windows](OtherSoftware/WindowsProgramInstructions/AutoHotKey.md)
- [Chocolatey - for installing applications and languages etc. in Windows](OtherSoftware/WindowsProgramInstructions/Chocolatey.md)
- [winget - for installing applications and languages etc. in Windows](OtherSoftware/WindowsProgramInstructions/Winget.md)
- [Windows Programs - notes about other Windows programs I use regularly](OtherSoftware/WindowsProgramInstructions/WindowsPrograms.md)
- [Zotero - a free and open source reference manager](OtherSoftware/WindowsProgramInstructions/Zotero.md)
