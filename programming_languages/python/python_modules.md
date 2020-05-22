# Useful Python Modules and Packages

## Random Modules and Packages

- docx2txt
    - this module converts docx files into plain text then you can print it out or write it to a txt file etc
        - sometimes very handy for student papers to all be in the same format
    - pip install docx2txt
    - [see this script](useful_scripts/docx_to_txt.py) for an implementation that takes all docx files in the local folder and converts them to txt files

    ```python
    text = docx2txt.process(file)
    ```

## PySpark

This is a big data analysis packages that requires a bit of setup

- you need to install the Java JDK

```PowerShell
choco install jdk8
```

## Creating a Local Package

- So it turns out that creating a package in python is a mess. They have changed the way they've wanted to do it several times. They're still kind of in flux but they're settling on some improvements and there are now a few ways to go about making the package the "better way." I decided to use poetry which is kind of like a package maker and a virtual environment manager all in one. Below are some of the things I would need to use to do all of it again.
    - [A link that was very useful to me in doing this](https://www.ictshore.com/python/create-python-modules-tutorial/), [this link](https://dev.to/sivakon/python-poetry-35ec) was helpful in learning more about packaging a python package when using poetry.
- first up is file structure below is an example of the structure I used for my package.
    - this will result in having to import like this: `import SandsPythonFunctions.ParquetFunctions as pf` then to use a function within that `ParquetFunctions.py` file `pf.function()`
    - the tests folder and the file inside I will explain in the [Pytest](#pytest) section

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
    - you can make do the build command over and over and it'll just overwrite what you had before (in the `baseDirectory/.dist`) and poetry each time you install using `poetry install` right after using `poetry build` it should reinstall the newer version that you just built for more testing
- If you want to publish this to PyPI for easy access anywhere then you will need to do the following after setting up your PyPI account and getting a token and then enter the publish command
    - you'll then enter your username and your token which you will have gotten from PyPI. You will then be able to use `pip install packageName` anywhere to use your package
    - each time you upload you will need to increase the version number contained in the `pyproject.toml` file before you upload it

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

### Pytest
