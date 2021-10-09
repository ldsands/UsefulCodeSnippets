# Python Installation Instructions and Notes

- [Python Installation Instructions and Notes](#python-installation-instructions-and-notes)
    - [Pyenv on Windows](#pyenv-on-windows)
    - [Pyenv (on WSL)](#pyenv-on-wsl)
    - [Anaconda](#anaconda)
        - [Anaconda PATH Windows instructions](#anaconda-path-windows-instructions)
        - [Install anaconda on WSL](#install-anaconda-on-wsl)
    - [Virtual environments](#virtual-environments)
        - [conda environments](#conda-environments)
        - [venv environments](#venv-environments)
        - [Poetry Environments](#poetry-environments)
    - [Useful Python Install Commands](#useful-python-install-commands)

## Pyenv on Windows

- Pyenv is a simpler version of what anaconda does but it is pretty much just as powerful. You can find the installation instructions [here](https://github.com/pyenv-win/pyenv-win#installation) on the github page for the project.

    ```PowerShell
    # install using chocolatey
    choco install pyenv-win
    # update the list of available versions of python for installation
    pyenv update
    # list all available versions of python for installation
    pyenv install --list
    # install python version 3.9.7
    pyenv install 3.9.7
    # set version 3.9.7 as the global version of python
    pyenv global 3.9.7
    ```

## Pyenv (on WSL)

- Pyenv is a simpler version of what anaconda does but it is pretty much just as powerful. I used [this site](https://dev.to/writingcode/the-python-virtual-environment-with-pyenv-pipenv-3mlo) for help putting this together. Below are the instructions to install pyenv and add it to path.

    ```sh
    # setup pyenv
    # upgrade everything
    sudo apt-get update && sudo apt-get upgrade -y
    # install dependencies
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
    # install pyenv and put into the PATH
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo '# pyenv stuff
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"\n' >> ~/.zshrc
    # install python using pyenv
    pyenv install 3.9.7
    # set this version to the global version of python
    pyenv global 3.9.7
    # see the version that was installed
    pyenv versions
    ```

- Setting up a global pyenv python base
    - List all of the possible versions of python you can install `pyenv install --list` or to list all of them of a certain version `pyenv install 3.9`
    - Install a version of python `pyenv install 3.9.7`
    - Make it available globally so you don't have to touch your system wide version of python (that comes with your distro) `pyenv global 3.9.7`
    - Enter `pyenv versions` to see what versions are available to you
    - You can install an extension that allows for updating pyenv using this command `pyenv update` you can install it on Ubuntu using this command: `git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update`
- Now you can install poetry see more detailed instructions [here](https://python-poetry.org/docs/master/#installation).
    - To publish the package to PyPI you will need to use an environment variable with your PyPI token.
    - More instructions on how to use poetry can be found [here](python_modules.md#creating-a-local-package).

    ```zsh
    # install poetry for python management
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
    echo '# poetry path
    export PATH="$HOME/.local/bin:$PATH"\n' >> ~/.zshrc
    mkdir $ZSH_CUSTOM/plugins/poetry
    poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
    # this adds the token for publishing from poetry to PyPI
    export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"
    # and again the persistent version
    echo 'export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"' >> ~/.zshrc
    ```

## Anaconda

### Anaconda PATH Windows instructions

This is for shen the add to path doesn't work for the chocolatey install

1. Copy the text below to get it into path from cmd (as administrator) I think you can use powershell now but you may have to type `conda init` first for it to work

    ```cmd
    setx PATH "%PATH%;C:\tools\Anaconda3;C:\tools\Anaconda3\Library\mingw-w64\bin;C:\tools\Anaconda3\Library\usr\bin;C:\tools\Anaconda3\Library\bin;C:\tools\Anaconda3\Scripts;C:\tools\Anaconda3\bin;C:\tools\Anaconda3\condabin"
    ```

1. Restart cmd and type the command below to test it

    ```cmd
    conda list
    ```

### Install anaconda on WSL

- Install Anaconda on WSL
    - Assuming you're using Windows you may want to use WSL 2 to install everything. To install WSL 2 (assuming you doing so after May 2020 it will be much easier) follow the instructions on [this site](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install). Once you have that installed you can install any of the linux distributions on the Windows Store I would recommend [using Ubuntu](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab).
    - Open up the command prompt and enter Ubuntu (or whatever distro you downloaded). Be sure to [check this site](https://repo.anaconda.com/archive/) for the latest releases of anaconda (note they seem to make about 3 releases a year or so). Install anaconda using the following code:
    - Much of this code was taken from [this site](https://phoenixnap.com/kb/how-to-install-anaconda-ubuntu-18-04)

    ```Bash
    # updates the apt-get repository
    sudo apt-get update
    # installs curl if you don't have it installed
    sudo apt-get install curl
    # navigate to the tmp folder
    ~
    cd /tmp
    # downloads the desired file from anaconda
    curl https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh --output anaconda.sh
    # installs anaconda from the file you downloaded
    bash anaconda.sh
    # disables automatic activation of base when starting a terminal
    conda config --set auto_activate_base false
    ```

    - Update conda packages

        ```sh
        conda update --all
        ```

    - To uninstall if you want

        ```sh
        rm Anaconda3-2020.02-Linux-x86_64.sh
        ```

    - To start jupyter

        ```sh
        jupyter notebook --no-browser this will provide a link that you can put into your browser
        ```

## Virtual environments

- You really shouldn't use python without using virtual environments. Basically what they do is manage to keep everything contained and consistent for projects so that sharing a project with someone else becomes far easier. There are then choices to be made about dependency management along with virtual environments. It may seem like it is more trouble than it is worth but I can assure you that it is not. If you ever want to run a project again in the future or share a project virtual environments are a _**massive**_ time saver.

- There are many methods of setting up and managing python environments.
- If you're using anaconda then use their environment manager it is very good and comprehensive it can also specify what version of python you're using which is very useful for sharing projects. However there is the drawback of not having all access to PyPI which is the official repository for all python packages. To get access to these you still have to use pip which occasionally does cause issues with conda. The reason conda does this is because pip does not deal with non-python packages very well. So if there is a package that depends on say c++ or some other lower level language pip has been known to be very bad at dealing with those dependencies. Anaconda solves that issue completely.

- Venv is what I recommend (for now) for "normal" python for the moment it is kind of limited (unable to handle a lot of non-python packages though this is more of a pip issue than venv) and a but more complicated to use and activate but it seems to work pretty well. Venv does not have the ability to dictate the version of python that is used either.
    - To create a local version of python `python -m venv venv`
    - You must then activate this new instance of python, for Linux `source venvUbu/bin/activate` for Windows `.\venv\Scripts\activate.ps1`

- Another option is [Pyflow](https://github.com/David-OConnor/pyflow) which uses Rust on the backend. It is very fast and very easy to use though you do have to have either a pyproject.toml or a line in the script similar to the following: `__requirements__ = ["pandas", "numpy"]` to work with pyflow. This may be my favorite as of Summer 2020 since it is so easy to use. To install pyflow there are several options however I recommend installing rust then use this command: `cargo install pylow`. Instructions on how to install Rust can be found [here](../rust/rust_install.md). If on a debian based distro you can also use this command `cd ~/ && wget https://github.com/David-OConnor/pyflow/releases/download/0.2.7/pyflow_0.2.7_amd64.deb && sudo dpkg -i pyflow_0.2.7_amd64.deb && rm pyflow* && pyflow --version`.
    - You can create the folder containing all of the Python and Python packages needed by entering `pyflow init` or in a new folder by entering `pyflow new ProjectName`.
    - You can then install packages by using `pyflow install packageName`. This installs that package in the folder containing the project.
    - If you want to run a script quickly or contain everything from within that script you can add a line like this: `__requires__ = ['packageName', 'anotherPackageName']`. Then enter `pyflow script myscript.py` and pyflow will install all of the requirements contained in that script.

- [Poetry](https://python-poetry.org/) is another option that looks a lot like conda but for "normal" python. It can deal with different versions of python as well though I liked using pyenv or pyflow for that better than Poetry (or pyenv-win for Windows which can be installed using chocolatey `choco install pyenv-win`, I haven't experimented with these yet though).

### [conda environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

Below are my instructions for setting up a conda environment for my reddit data project

- First you need to install anaconda (on windows make sure to check the add to path option)
    - Using command prompt (on windows) or in the bash shell (on linux) you can use the code below to create a conda environment

    ```sh
    # display all versions of python available to conda
    conda search python
    # create environment with the specified python version
    conda create -n myenv python=3.7.4 -y
    # activate the newly created environment
    conda activate myenv
    # install some packages using conda
    conda install notebook dask tqdm flake8 altair black -y
    # install some packages to the conda environment using pip
    pip install pyarrow zstandard requests
    # deactivate the currently activated conda environment
    conda deactivate
    # remove the conda environment
    conda remove --name myenv --all
    ```

    - Sometimes you need to add packages from conda forge you may need to do this by using `conda install -c conda-forge` then the name of the package that is available on conda forge.

### [venv environments](https://docs.python.org/3/tutorial/venv.html)

To use venv is both a bit more complicated. launching these environments aren't as straight forward (at least on Windows) but it works pretty much the same way. Be aware that you cannot specify the version of python you use when using venv it just creates an environment for the version that you're using to load venv.

- You first have to have python installed (the below example is using python 3.8.1)
    - Python -m venv general_use this creates the new environment
    - General_use\Scripts\activate.bat or general_use\Scripts\activate.ps1 (if you're using powershell) this "opens" or activates this environment
    - Pip install flake8 black notebook tqdm docx2txt this installs any modules that are listed after the install command
    - To leave the environment you can just type deactivate

    ```python
    python -m venv general_u
    pip install flake8 black notebook tqdm docx2txt
    deactivate
    ```

### [Poetry Environments](https://python-poetry.org/docs/managing-environments/#:~:text=Poetry%20makes%20project%20environment%20isolation%20one%20of%20its,use%20it%20directly%20without%20creating%20a%20new%20one.)

Poetry will use whatever virtual environment is activated to build the project that you're working on. It will create a pyproject.toml file and if you follow the instructions [here](#pyenv-with-poetry) you can setup the project with relative ease.

## Useful Python Install Commands

- Once you have Python running you can easily find the location of the python installation by running `Python` in your shell and then entering the following commands:

    ```Python
    import os, sys
    os.path.dirname(sys.executable)
    ```

- To automatically install packages from a list you can read more [here](python_modules.md#Install-Python-Modules-Within-a-Script).

- When installing python on Windows you can usually just install it from the store but there are some packages cannot "see" that python installation. To deal with this you can do the following after installing python fro mthe python.org website or when installed using chocolatey or winget.

    ```PowerShell
    # set a new path that will be added to the path environment
    $NewPath = "C:\Users\%username%\AppData\Local\Programs\Python\Python38-32\Scripts;C:\Users\%username%\AppData\Local\Programs\Python\Python38-32"
    # save the old path to a variable
    $OldPath = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH).path
    # concatenate the paths
    $NewCombinedPath = "$($NewPath);$($OldPath)"
    # add the new path to the path
    Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH -Value $NewCombinedPath
    # check the path to make sure it worked correctly
    (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH).Path -split ";"
    # delete the Windows aliases that send you to the Windows store every time you type python
    ```
