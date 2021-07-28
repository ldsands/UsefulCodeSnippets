# Useful Python Modules and Packages

- [Useful Python Modules and Packages](#useful-python-modules-and-packages)
    - [Random Modules and Packages](#random-modules-and-packages)
        - [pywin32](#pywin32)
        - [PySpark](#pyspark)
    - [Install Python Modules Within a Script](#install-python-modules-within-a-script)
    - [Creating a Local Package](#creating-a-local-package)
    - [Modules to Look Into](#modules-to-look-into)

## Random Modules and Packages

- [docx2txt](https://github.com/ankushshah89/python-docx2txt)
    - This module converts docx files into plain text then you can print it out or write it to a txt file etc
        - Sometimes very handy for student papers to all be in the same format
    - `pip install docx2txt`
    - [see this script](useful_scripts/doc_docx_pdf_txt_converter.py) for an implementation that takes all docx files in the local folder and converts them to txt files
    - Be aware that if a document was created using office online this package cannot yet convert it. This will hopefully addressed soon (as of Nov 2020) the issue already has a temporary fix that can be used if needed. Progress on this issue can be tracked [here](https://github.com/ankushshah89/python-docx2txt/issues/16).
    - An alternative (docx2python) can be found [here](https://docx2python.readthedocs.io/en/latest/#). Another alternative (pypandoc) can be found [here](https://github.com/bebraw/pypandoc)

    ```Python
    text = docx2txt.process(file)
    ```

- [PrettyErrors](https://github.com/onelivesleft/PrettyErrors/) - "Prettify Python exception output to make it legible." Just add `import pretty_errors` to the file and errors will be much more readable.
- [pdfminer.six](https://github.com/pdfminer/pdfminer.six) - "extracting information from PDF documents. It focuses on getting and analyzing text data."

- [Altair](https://altair-viz.github.io/index.html)
    - This module is very good graphing data taken from pandas. I choose this over other options such as matplotlib or seaborne because of the vega and vega-lite backend which also have plugins/packages in both Julia and R. You can also edit them manually in a browser if needed.
    - Be aware that to save the charts as png or svg files you'll need to install node.js and npm the instructions for installing this on Ubuntu/WSL/Debian are below:

    ```zsh
    # install node.js
    sudo apt install nodejs
    # check to see if it worked
    nodejs -v
    # install npm
    sudo apt install npm
    # check to see if it worked
    npm --v
    # install vega lite and vega cli canvas for saving charts into the png, svg etc. formats
    npm install vega-lite vega-cli canvas
    ````

- [Pyinstaller](https://github.com/pyinstaller/pyinstaller)
    - This module allows you to create an executable file which can then be used easily in a terminal or if you have added GUI components you can use that too. I have used it to convert the script included [here](./useful_scripts/docx_pdf_txt_converter.py) into an exe that I use frequently with just calling one command.
- [Requests](https://requests.readthedocs.io/en/master/)
    - Very useful to scraping websites
    - Some more advanced commands with requests can be found [here](https://findwork.dev/blog/advanced-usage-python-requests-timeouts-retries-hooks/)
- [Graph-tool](https://graph-tool.skewed.de/)
    - I use this over networkx for any networks that are very large, otherwise networkx takes a very long time to deal with large networks
    - This is a network visualization package that must cannot be installed using pip the instructions for installation can be found [here](https://git.skewed.de/count0/graph-tool/-/wikis/installation-instructions)
    - for Ubuntu 20.04 you can use this command: `sudo sh -c "echo 'deb [ arch=amd64 ] https://downloads.skewed.de/apt focal main' >> /etc/apt/sources.list"` then `sudo apt-key adv --keyserver keys.openpgp.org --recv-key 612DEFB798507F25` then `sudo apt-get update && sudo apt-get upgrade -y` and then `sudo apt-get install python3-graph-tool`
    - It seems that the better way to go about installing and using graph-tool is to use anaconda, graph-tool has spicifically been designed for installation and use on anaconda, steps to install and use anaconda on Ubuntu is included below

    ```sh
    # use pyenv to install anaconda and then activate it globally to create the virtual environment for graph-tools
    pyenv install anaconda3-2020.11
    pyenv global anaconda3-2020.11
    # create environment
    conda create -n graphtool python=3.8.5 -y
    # activate the environment
    conda activate graphtool
    # install required packages
    conda install numpy pandas tqdm flake8 black isort -y
    pip install pyarrow zstandard sandspythonfunctions
    # install graph-tool
    conda install -c conda-forge graph-tool

    For using igraph add the following
    conda install -y -c conda-forge python-igraph
    ```

### pywin32

This package allows for accessing the Windows API. The installation is a bit complicated so I've included a script that does most of the installation automatically. The file is called `pywin32install`. Run that and follow the instructions it should finish the installation correctly.

### PySpark

This is a big data analysis packages that requires a bit of setup

- You need to install the Java JDK, then you can used pip to install pyspark

    ```sh
    # for Windows
    choco install jdk8
    # for Ubuntu
    sudo apt update && sudo apt -y upgrade && sudo apt install default-jdk && java -version
    ```

## Install Python Modules Within a Script

- To automatically install packages from a list you can use the either of the two example code options below

    ```Python
    # This will load the modules and if it is not installed it will install it using pip
    modules = ["pathlib", "docx2txt", "pprint", "pikepdf"]
    def install_and_import(modules):
        import importlib
        import os
        for module in modules:
            try:
                importlib.import_module(module)
                print(module, "imported")
            except ImportError:
                print(f"installing {module}")
                os.system(f"pip install {module}")
                print(module, "installed")
                try:
                    globals()[module] = importlib.import_module(module)
                    print(module, "imported")
                except ImportError:
                    print(f"There was an error while trying to install {module}")
    install_and_import(modules)
    ```

    ```Python
    import sys
    import subprocess
    import pkg_resources

    required = {'numpy','pandas','<etc>'} 
    installed = {pkg.key for pkg in pkg_resources.working_set}
    missing = required - installed
    if missing:
        # implement pip as a subprocess:
        subprocess.check_call([sys.executable, '-m', 'pip', 'install',*missing])
    ```

## Creating a Local Package

- So it turns out that creating a package in python is a mess. They have changed the way they've wanted to do it several times. They're still kind of in flux but they're settling on some improvements and there are now a few ways to go about making the package the "better way." I decided to use poetry which is kind of like a package maker and a virtual environment manager all in one. Below are some of the things I would need to use to do all of it again.
    - [A link that was very useful to me in doing this](https://www.ictshore.com/python/create-python-modules-tutorial/), [this link](https://dev.to/sivakon/python-poetry-35ec) was helpful in learning more about packaging a python package when using poetry.
- First up is file structure below is an example of the structure I used for my package.
    - This will result in having to import like this: `import SandsPythonFunctions.ParquetFunctions as pf` then to use a function within that `ParquetFunctions.py` file `pf.function()`
    - The tests folder and the file inside I will explain in the [Pytest](#pytest) section

    ```plaintext
    PackageName/
    ┣ dist/
    ┃ ┣ PackageName-0.0.1a4-py3-none-any.whl
    ┃ ┗ PackageName-0.0.1a4.tar.gz
    ┣ src/
    ┃ ┣ PackageName/
    ┃ ┃ ┣ EmailFunctions.py
    ┃ ┃ ┣ ParquetFunctions.py
    ┃ ┃ ┗ __init__.py
    ┃ ┗ tests/
    ┃ ┃ ┣ parquet_test_files/
    ┃ ┃ ┃ ┣ SNAPPY_pandas_pyarrow_nation.parquet
    ┃ ┃ ┣ EmailFunctions_test.py
    ┃ ┃ ┗ ParquetFunctions_test.py
    ┣ .gitignore
    ┣ LICENSE
    ┣ poetry.lock
    ┣ pyproject.toml
    ┗ README.md
    ```

- Poetry will more or less create something like this for you if you follow their instructions [here](https://python-poetry.org/docs/cli/#new) when you enter the code below it'll create a file structure and more importantly the `pyproject.toml` file which tells poetry and python what to do with the project.
- The second line of code below will help you create the `pyproject.toml` file with some defailts and some prompts to get it started.
    - More details on the `pyproject.toml` file is located [here](https://python-poetry.org/docs/pyproject/)
- Once you're done then run the build command and then the `poetry install` commands to test it out in the environment you have activated.
    - You'll then want to follow the instructions [here](python_install.md#pyenv-with-poetry) that I created that goes over how to use an python environment using pyenv-virtualenv and poetry.
    - You can make do the build command over and over and it'll just overwrite what you had before (in the `baseDirectory/.dist`) and poetry each time you install using `poetry install` right after using `poetry build` it should reinstall the newer version that you just built for more testing
- If you want to publish this to PyPI for easy access anywhere then you will need to do the following after setting up your PyPI account and getting a token and then enter the publish command
    - You'll then enter your username and your token which you will have gotten from PyPI. You will then be able to use `pip install packageName` anywhere to use your package
    - Each time you upload you will need to increase the version number contained in the `pyproject.toml` file before you upload it

    ```zsh
    # create new package/project
    poetry new --src my-package
    # help with creating the pyproject.toml
    poetry init
    # activate a virtual environment
    pyevn activate TestEnv
    # build the project
    poetry build
    # update the build of the package/project
    poetry install
    # publish the project
    poetry publish
    ```

## Modules to Look Into

- [AutoScraper](https://github.com/alirezamika/autoscraper): A Smart, Automatic, Fast and Lightweight Web Scraper for Python
- [DearPyGui](https://github.com/hoffstadt/DearPyGui): "Dear PyGui: A fast and powerful Graphical User Interface for Python with minimal dependencies" Has MIT licence
- [Fil](https://github.com/pythonspeed/filprofiler): for memory profiling a script
- [Helium](https://github.com/mherrmann/selenium-python-helium): Selenium-python is great for web automation. Helium makes it easier to use.
- [Jupytext](https://github.com/mwouts/jupytext): Jupyter Notebooks as Markdown Documents, Julia, Python or R scripts
- [MyST](https://myst-parser.readthedocs.io/en/latest/index.html): MyST allows you to write Sphinx documentation entirely in markdown.
- [PandasGUI](https://github.com/adamerose/PandasGUI): A GUI for Pandas DataFrames
- [PyFlow](https://github.com/David-OConnor/pyflow): An installation and dependency system for Python (it looks way easier than environments)
- [PySimpleGUI](https://github.com/PySimpleGUI/PySimpleGUI): Python GUI For Humans - Transforms tkinter, Qt, Remi, WxPython into portable people-friendly Pythonic interfaces - [RealPython Article](https://realpython.com/pysimplegui-python/)
- [PySnooper](https://github.com/cool-RR/pysnooper):  "[Y]ou just add one decorator line to the function you're interested in. You'll get a play-by-play log of your function [...]"
- [Rich](https://github.com/willmcgugan/rich): Rich is a Python library for rich text and beautiful formatting in the terminal.
- [Sidetable](https://pbpython.com/sidetable.html): Create Simple Summary Tables in Pandas
- [Tabulate](https://github.com/astanin/python-tabulate): Pretty-print tabular data in Python, a library and a command-line utility.
- [Typer](https://github.com/tiangolo/typer): Typer, build great CLIs. Easy to code. Based on Python type hints.
