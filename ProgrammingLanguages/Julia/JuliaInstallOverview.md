# Julia Installation and Overview

Julia is a newer programming language that is meant to be dynamically typed like python but be very fast like C or C++. It isn't quite that simple but generally if you write something in pure Julia and pure python Julia will always be faster but because of python's popularity many packages that you might use in Python are actually written in C or C++ or another lower level language. For example, pandas is writing primarily in C using Cython with a python wrapper around it for ease of use. If you wanted to do something unique with pandas or needed to change something in pandas you would have to know C in order to do that. Julia seeks to address this problem by writing as much as possible of all Julia packages in Julia. So if you want to tweak something you can because you already know Julia.

## Useful resources

- [For parallel programming](https://nbviewer.jupyter.org/github/sylvaticus/juliatutorial/blob/master/assets/Parallel%20computing.ipynb)
- Food documentation and tutorials
    - [Official documentation](https://docs.julialang.org/en/latest/) the manual in particular is very good
    - [A wikibook](https://en.wikibooks.org/wiki/Introducing_Julia) that is for introductory Julia concepts also very well done
    - [The Julia style guide](https://docs.julialang.org/en/v1/manual/style-guide/index.html#Style-Guide-1)
        - Note: generally variables use `_` for variable name word separating whereas methods use camel case.

## Installation

Julia can be downloaded from [this site](https://julialang.org/downloads/). Instructions for installation on each major OS are located [here](https://julialang.org/downloads/platform/).

- The best way to install Julia now is to first install [Juliaup](https://github.com/JuliaLang/juliaup)
    - Juliaup allows you to install an manage multiple versions of Julia. Installation instructions can be found [here](https://github.com/JuliaLang/juliaup#installation).
- For Windows you can install Julia using chocolatey (see below).

    ```PowerShell
    # Chocolatey Command
    choco install julia
    # Chocolatey upgrade command
    choco upgrade julia
    # WinGet command
    winget install --id=Julialang.Julia -e
    ```

- For Linux Julia can be installed with the following commands:

    ```sh
    # create required folders
    cd ~ && mkdir .julia && cd .julia
    # download julia from julialang.org (make sure you check the version and change it accordingly)
    curl https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.0-linux-x86_64.tar.gz -o julia-1.5.0.tar.gz && tar -xvzf julia-1.5.0.tar.gz
    # create the environment variable needed to run Julia Note: sure you change the <user name> to your <user name>
    echo 'export PATH="$PATH:/home/<user name>/.julia/julia-1.5.0/bin/"' >> ~/.zshrc
    # create a variable to allow Julia to use more threads at startup
    export JULIA_NUM_THREADS=16
    ```

## Installing and Loading Packages

Once you've installed Julia on your system you'll want to update your package repository and install some packages. These instructions are duplicated [here](JuliaUsefulCommands.md)

- You can do this in the REPL or through a script here is the commands need to update through the REPL:

    ```sh
    # enter the Julia REPL
    julia
    # load and update the package repository
    using Pkg
    Pkg.update()
    # install a package
    Pkg.add("package")
    # load the package
    using package
    # exit the REPL
    exit()
    ```

- To update and install packages through a script you can enter the following to your script and then run it. Note: the `Pkg.installed` method has been deprecated and will not be available in the future so this function will no longer work as well.

    ```Julia
    # this script installs all required packages to run this script
    package_list = ["DataFrames", "Gadfly", "JuliaFormatter", "Glob", "CodecZstd", "FileIO", "Arrow", "Feather", "ParquetFiles", "CSV"]
    using Pkg
    function InstallPackages!(package_list)
        println("Installation of required packages to run this script")
        Pkg.update()
        for package in package_list
            if ! in(package, keys(Pkg.installed())) Pkg.add(package) end
        end
        @warn("Packages installed!")
    end
    InstallPackages(package_list)
    ```
