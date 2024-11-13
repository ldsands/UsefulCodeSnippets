# Python Installation Instructions and Notes

- [Python Installation Instructions and Notes](#python-installation-instructions-and-notes)
    - [Pyenv on Windows](#pyenv-on-windows)
    - [Pyenv On Linux (Including WSL)](#pyenv-on-linux-including-wsl)
    - [Anaconda](#anaconda)
        - [Anaconda PATH Windows instructions](#anaconda-path-windows-instructions)
        - [Install anaconda on WSL](#install-anaconda-on-wsl)
    - [Virtual environments](#virtual-environments)
        - [Pipenv Environments](#pipenv-environments)
        - [Conda Environments](#conda-environments)
        - [venv environments](#venv-environments)
        - [Poetry Environments](#poetry-environments)
        - [Rye Environments (Use UV instead)](#rye-environments-use-uv-instead)
        - [uv Environments](#uv-environments)
    - [Useful Python Install Commands](#useful-python-install-commands)

## Pyenv on Windows

- Pyenv is a simpler version of what anaconda does but it is pretty much just as powerful. You can find the installation instructions [here](https://github.com/pyenv-win/pyenv-win#installation) on the github page for the project.

    ```PowerShell
    # install using chocolatey
    choco install pyenv-win
    # install using PowerShell
    Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
    # update the list of available versions of python for installation
    pyenv update
    # list all available versions of python for installation
    pyenv install --list
    # install python version 3.9.7
    pyenv install 3.9.7
    # set version 3.9.7 as the global version of python
    pyenv global 3.9.7
    ```

## Pyenv On Linux (Including WSL)

- Pyenv is a simpler version of what anaconda does but it is pretty much just as powerful. I used [this site](https://dev.to/writingcode/the-python-virtual-environment-with-pyenv-pipenv-3mlo) for help putting this together. Below are the instructions to install pyenv and add it to path.
    - You will likely need to install some dependencies to build python. More about that can be found [here](https://github.com/pyenv/pyenv/wiki#troubleshooting--faq).

    ```sh
    # setup pyenv for Ubuntu (including Ubuntu on WSL)
    # upgrade everything for Ubuntu
    sudo apt-get update && sudo apt-get upgrade -y
    # install dependencies for Ubuntu
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
    # upgrade everything for Fedora

    # install dependencies for Fedora
    sudo dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel -y
    # install pyenv using the script contained [here](https://github.com/pyenv/pyenv-installer)
    curl https://pyenv.run | bash
    # add this to the shell config file (~/.zshrc for zsh, ~/.bashrc for bash)
    echo '
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
    ' >> ~/.bashrc
    # now restart the shell
    exec $SHELL
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
    - More instructions on how to use poetry can be found [here](PythonModules.md#creating-a-local-package).

    ```sh
    # To install Poetry on Linux
    curl -sSL https://install.python-poetry.org | python3 -
    # To install Poetry on Windows (must use PowerShell)
    (Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -
    # because I use pyenv to manage multiple versions of python at once I change a setting as shown below so that Poetry uses the same version of python
    poetry config virtualenvs.prefer-active-python true
    ```

    ```zsh
    # below is the pld way of installing
    # install poetry on Linux for python management
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
    # if you have issues with poetry not being added to PATH you can use the command below
    echo '# poetry path
    export PATH="$HOME/.local/bin:$PATH"
    export PATH=$HOME/.local/bin/poetry:$PATH' >> ~/.bashrc
    mkdir $ZSH_CUSTOM/plugins/poetry
    poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
    # this adds the token for publishing from poetry to PyPI
    export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"
    # and again the persistent version
    echo 'export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"' >> ~/.bashrc
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
    - To create a local version of python `python -m venv .venv`
    - You must then activate this new instance of python, for Linux `source ./.venvUbu/bin/activate` for Windows `.\venv\Scripts\activate.ps1`

- Another option is [Pyflow](https://github.com/David-OConnor/pyflow) which uses Rust on the backend. It is very fast and very easy to use though you do have to have either a pyproject.toml or a line in the script similar to the following: `__requirements__ = ["pandas", "numpy"]` to work with pyflow. This may be my favorite as of Summer 2020 since it is so easy to use. To install pyflow there are several options however I recommend installing rust then use this command: `cargo install pylow`. Instructions on how to install Rust can be found [here](../Rust/RustInstall.md). If on a debian based distro you can also use this command `cd ~/ && wget https://github.com/David-OConnor/pyflow/releases/download/0.2.7/pyflow_0.2.7_amd64.deb && sudo dpkg -i pyflow_0.2.7_amd64.deb && rm pyflow* && pyflow --version`.
    - You can create the folder containing all of the Python and Python packages needed by entering `pyflow init` or in a new folder by entering `pyflow new ProjectName`.
    - You can then install packages by using `pyflow install packageName`. This installs that package in the folder containing the project.
    - If you want to run a script quickly or contain everything from within that script you can add a line like this: `__requires__ = ['packageName', 'anotherPackageName']`. Then enter `pyflow script myscript.py` and pyflow will install all of the requirements contained in that script.

- [Poetry](https://python-poetry.org/) is another option that looks a lot like conda but for "normal" python. It can deal with different versions of python as well though I liked using pyenv or pyflow for that better than Poetry (or pyenv-win for Windows which can be installed using chocolatey `choco install pyenv-win`, I haven't experimented with these yet though).

- [Rye](https://rye-up.com/) is another option that looks a lot like Poetry but also manages python versions. It also makes all virtual environments use python that has been pre-compiled then downloaded so that rye can be as portable as possible. [More detailed can be found here](#rye-environments).

### [Pipenv Environments](https://docs.pipenv.org/)

- This will create and manage virtual environments and adds and removes packages from a lock file and when used with pyenv it can install the version of python required for a project. Below are some lines of code that can be reused.

```sh
# move into the project directory
cd myproject
# you can set the specific version of python if needed
pipenv --python 3.10.3
# if there already is a pipfile
pipenv install
# Ignore the Pipfile.lock and install from the Pipfile. In addition, do not write out a Pipfile.lock reflecting changes to the Pipfile.
pipenv install --skip-lock
# if you need to install packages (for a new or old project) you install just like pip
pipenv install pandas
# if you need to install packages that are only used for development use
pipenv install --dev black flake8 pretty-errors
# activate the pipenv virtual environment
pipenv shell
# check for outdated packages
pipenv update --outdated
# upgrade all outdated packages
pipenv update
# to remove the pipenv virtual environment load the virtual environment then remove it
pipenv --rm
# will show you a dependency graph of your installed dependencies
pipenv graph
```

### [Conda Environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

Below are my instructions for setting up a conda environment for my reddit data project

- First you need to install anaconda (on windows make sure to check the add to path option)
    - Using command prompt (on windows) or in the bash shell (on linux) you can use the code below to create a conda environment

    ```sh
    # display all versions of python available to conda
    conda search python
    # you also often need to use this command to be able to use anaconda commands in your shell
    conda init zsh # or powershell (there are more as well)
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

    - Another way to create a conda environment is to [create an `environment.yml` file](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file).
        - To activate
    - Sometimes you need to add packages from conda forge you may need to do this by using `conda install -c conda-forge` then the name of the package that is available on conda forge.

### [venv environments](https://docs.python.org/3/tutorial/venv.html)

To use venv is a bit more complicated. Launching these environments aren't as straight forward (at least on Windows) but it works pretty much the same way. Be aware that you cannot specify the version of python you use when using venv it just creates an environment for the version that you're using to load venv.

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

### Poetry Environments

- This will create and manage virtual environments using Poetry

```sh
pyenv install 3.9.16
pyenv local 3.9.16
TODO:
```

More can be found [here](https://python-poetry.org/docs/managing-environments/#:~:text=Poetry%20makes%20project%20environment%20isolation%20one%20of%20its,use%20it%20directly%20without%20creating%20a%20new%20one.)

- Poetry will use whatever virtual environment is activated to build the project that you're working on. It will create a pyproject.toml file and if you follow the instructions [here](#pyenv-with-poetry) you can setup the project with relative ease.
- To use pyenv with Poetry you can set the version of python by creating a local version of python file (using pyenv). See below for an example of how to do this.

```sh
pyenv install 3.10
pyenv local 3.10
poetry install
```

- For a brand new project Poetry will create a new directory using a default file structure ([more here](https://python-poetry.org/docs/basic-usage/#project-setup)). You can also create a pyproject.toml file for existing projects and thus avoid creating a new project file structure for the project ([more here](https://python-poetry.org/docs/basic-usage/#initialising-a-pre-existing-project)).
- To activate Poetry's virtual environment see below ([more here](https://python-poetry.org/docs/basic-usage/#activating-the-virtual-environment)).
- To add dependencies for the project to the `pyproject.toml` file the easiest way is to use `poetry add package_name` you can also add dependencies manually ([more here](https://python-poetry.org/docs/basic-usage/#specifying-dependencies)).

```sh
# create new project
poetry new poetry-demo
# create pyproject.toml for existing project
cd pre-existing-project
poetry init
# add dependencies
poetry add pandas
# activate Poetry's virtual environment
poetry shell
# you can also manually activate a Poetry virtualenv more directly (first line Linux second line for Windows)
source {path_to_venv}/bin/activate
{path_to_venv}\Scripts\activate.ps1
# to deactivate just use the exit or deactivate command
poetry exit # for when you use poetry shell to activate your virtualenv 
poetry deactivate # for when you manually activate your virtualenv
# to show Poetry virtualenv info and the next line just the path of the virtualenv
poetry env info
poetry env info --path
# to list Poetry envs
poetry env list
# to delete a Poetry env use the remove command (3 examples below)
poetry env remove /full/path/to/python
poetry env remove python3.7
poetry env remove 3.7
```

- To restrict the version of Python (same syntax for all version requirements) you can do the following:

```toml
[tool.poetry.dependencies]
python = "^3.10, <3.11"
```

### Rye Environments (Use UV instead)

- I used to use rye but all rye features will eventually be implemented into UV there are some options to convert from rye to UV
    - you should be able to just replace `tool.rye` with `tool.uv` in `pyproject.toml` then run `uv sync`
        - [you can find more about in this GitHub discussion](https://github.com/astral-sh/rye/discussions/1342#discussioncomment-10405626)
    - [There is a migration tool that you can use](https://github.com/lucianosrp/rye-uv)
- Installation
    - Note that some linux distros may need additional package installation. For Arch you'll need `libxcrypt-compat` install using `yay` or something similar. [The related issue can be found on GitHub](https://github.com/mitsuhiko/rye/issues/15).

```sh
# on linux
# run installation script (should run in bash)
curl -sSf https://rye-up.com/get | bash
# add shims to ~/.bashrc
echo '
# add rye shims to path
source "$HOME/.rye/env"
'  >> ~/.bashrc
# verify that rye is installed
rye
```

- Below is example code to start a new project and get it going

```sh
# create new project
rye init my-project
cd my-project
# set python version (create .python-version file)
rye pin 3.10
# start first sync and create virtual environment
rye sync
```

### uv Environments

- "An extremely fast Python package and project manager, written in Rust." It can manage both python versions and virtual environments.
- [Documentation can be found at this link](https://docs.astral.sh/uv/)

```sh
# to install uv on Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
# to install uv on Windows
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

- [For basic project management](https://docs.astral.sh/uv/#project-management)
    - Note: lockfiles are created and updated whenever `uv sync` or `uv run` are used. "The lockfile may also be explicitly updated using `uv lock`." This lockfile is unique to uv.

```sh
# create project
uv init ExampleProject
# move into created directory
cd ExampleProject
# add packages
uv add ruff
# can then use the installed packages if needed
uv run ruff check
# to run an example script
uv run python hello.py
# to install the requirements for an existing project (must be in directory containing `pyproject.toml`)
uv sync
# upgrade the latest package versions supported by within the project's constraints
uv lock --upgrade
# to generate a requirements.txt
uv pip compile pyproject.toml -o requirements.txt
```

- [Managing python versions with uv](https://docs.astral.sh/uv/guides/install-python/)
    - This is similar to pyenv but has many benefits over pyenv

```sh
# To list installed and available Python versions:
uv python list
# install python 3.12 (latest stable release)
uv python install 3.12
# To install multiple Python versions:
uv python install 3.11 3.12
# To install a version that satisfies constraints:
uv python install '>=3.8,<3.10'
```

- [uv also has the ability install "tools" that can be used from anywhere](https://docs.astral.sh/uv/guides/tools/)
    - you can think of this like pipx

```sh
# install a packages as a uv tool
uv tool install ruff
# use that package
ruff --version
```

## Useful Python Install Commands

- Once you have Python running you can easily find the location of the python installation by running `Python` in your shell and then entering the following commands:

    ```Python
    import os, sys
    os.path.dirname(sys.executable)
    ```

- To automatically install packages from a list you can read more [here](PythonModules.md#install-python-modules-within-a-script).

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
