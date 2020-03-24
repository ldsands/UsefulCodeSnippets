# Julia Installation and Overview

Julia is a newer programming language that is meant to be dynamically typed like python but be very fast like C or C++. It isn't quite that simple but generally if you write something in pure Julia and pure python Julia will always be faster but because of python's popularity many packages that you might use in Python are actually written in C or C++ or another lower level language. For example, pandas is writing primarily in C using Cython with a python wrapper around it for ease of use. If you wanted to do something unique with pandas or needed to change something in pandas you would have to know C in order to do that. Julia seeks to address this problem by writing as much as possible of all Julia packages in Julia. So if you want to tweak something you can because you already know Julia.

## Useful resources

- [for parallel programming](https://nbviewer.jupyter.org/github/sylvaticus/juliatutorial/blob/master/assets/Parallel%20computing.ipynb)
- good documentation and tutorials
    - [official documentation](https://docs.julialang.org/en/latest/) the manual in particular is very good
    - [a wikibook](https://en.wikibooks.org/wiki/Introducing_Julia) that is for introductory Julia concepts also very well done

## Installation

Julia can be downloaded from [this site](https://julialang.org/downloads/). Or if you're on Windows you can install Julia using chocolatey (see below).

    ```powershell
    choco install julia
    ```
