# Python installation instructions and notes

## Pyenv With Poetry

Pyenv is a simpler version of what anaconda does but with poetry (which uses pyenv) it is pretty much just as powerful. I used [this site](https://dev.to/writingcode/the-python-virtual-environment-with-pyenv-pipenv-3mlo) for help putting this together. Poetry is kind of like anaconda but just newer and a little less separated from the rest of the python ecosystem.

- Install Pyenv on linux (with zsh) and add to the PATH

    ```zsh
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    # you also need these for using pyenv
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
    exec "$SHELL"
    # now to set the new default for future projects
    pyenv install 3.8.3
    pyenv global 3.8.3
    pyenv versions
    # Install virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    echo 'if [[ -z "$VIRTUAL_ENV" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    fi' >> ~/.zshrc
    exec "$SHELL"
    # example virtual environment using pyenv-virtualenv
    pyenv virtualenv TestEnv
    # set this environment to global and activates it
    pyenv global TestEnv
    pyenv deactivate
    ```

- setting up a global pyenv python base
    - list all of the possible versions of python you can install `pyenv install --list` or to list all of them of a certain version `pyenv install 3.8`
    - install a version of python `pyenv install 3.8.3`
    - make it available globally so you don't have to touch your system wide version of python (that comes with your distro) `pyenv global 3.8.3`
    - enter `pyenv versions` to see what versions are available to you
- Now to add virtualenv. [This article](https://realpython.com/intro-to-pyenv/#virtual-environments-and-pyenv) was helpful for understanding virtualenv better. To install see above.
    - for usage of virtualenv see [this link](https://github.com/pyenv/pyenv-virtualenv#usage) on their github repo
- now to install poetry see more detailed instructions [here](https://github.com/pyenv/pyenv/wiki/Common-build-problems).
    - Note that the `sudo apt-get install python-is-python3` probably won't be needed after late May of 2020 due to a fix

    ```zsh
    # install poetry for python management
    sudo apt-get install python-is-python3
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
    mkdir $ZSH/plugins/poetry
    poetry completions zsh > $ZSH/plugins/poetry/_poetry
    sudo apt-get install python3-venv -y
    exec "$SHELL"
    ```

- once you have poetry installed you can use it with the pyenv-virtualenv environments
    - `poetry install` will install everything that is required (and specified by the poetry pyproject.toml) it will also create a poetry.lock file which will not allow for updating manually thus avoiding a lot of incompatibility headaches. Also if you've used poetry to install the dependencies in a pyenv-virtualenv environment then you'll need to activate it by entering `poetry shell` into the command line.
    - if you create a virtual environment just using poetry you can remove it by using this command `poetry env remove envname`
    - if you're using a global environment you will have to do the poetry install from the location of the pyproject.toml file for it to work

    ```zsh
    # poetry used with pyenv virtualenv while having a virtual environment activated
    poetry install
    poetry shell
    poetry env info
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
    - much of this code was taken from [this site](https://phoenixnap.com/kb/how-to-install-anaconda-ubuntu-18-04)

    ```Bash
    # updates the apt-get repository
    sudo apt-get update
    # installs curl if you don't have it installed
    sudo apt-get install curl
    # navigate to the tmp folder
    ~
    cd /tmp
    # downloads the desired file from anaconda
    curl https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh --output anaconda.sh
    # installs anaconda from the file you downloaded
    bash anaconda.sh
    # disables automatic activation of base when starting a terminal
    conda config --set auto_activate_base false
    ```

    - Update conda packages

        ```sh
        conda update --all
        ```

    - to uninstall if you want

        ```sh
        rm Anaconda3-2020.02-Linux-x86_64.sh
        ```

    - To start jupyter

        ```sh
        jupyter notebook --no-browser this will provide a link that you can put into your browser
        ```

## Virtual environments

You really shouldn't use python without using virtual environments. Basically what they do is manage to keep everything contained and consistent for projects so that sharing a project with someone else becomes far easier. There are then choices to be made about dependency management along with virtual environments. It may seem like it is more trouble than it is worth but I can assure you that it is not. If you ever want to run a project again in the future or share a project virtual environments are a _**massive**_ time saver.

There are many methods of setting up and managing python environments but I would recommend two of them. If you're using anaconda then use their environment manager it is very good and comprehensive it can also specify what version of python you're using which is very useful for sharing projects. However there is the drawback of not having access to PyPI which is the official repository for all python packages. To get access to these you still have to use pip which occasionally does cause issues with conda. The reason conda does this is because pip does not deal with non-python packages very well. So if there is a package that depends on say c++ or some other lower level language pip has been known to be very bad at dealing with those dependencies. Anaconda solves that issue completely.

Venv is what I recommend (for now) for "normal" python for the moment it is kind of limited (unable to handle a lot of non-python packages though this is more of a pip issue than venv) and a but more complicated to use and activate but it seems to work pretty well. I does not have the ability to dictate the version of python that is used either.

>Update soon VS Code will be supporting [poetry](https://python-poetry.org/) which looks a lot like conda but for "normal" python. Once they complete the VS Code support I'll probably add the details here. it kind of deal with different versions of python as well though the better solution is to use pyenv (or pyenv-win for Windows which can be installed using chocolatey `choco install pyenv-win`, I haven't experimented with these yet though).

### [conda environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

Below are my instructions for setting up a conda environment for my reddit data project

1. first you need to install anaconda (on windows make sure to check the add to path option)
1. using command prompt (on windows) or in the bash shell (on linux) I entered the following commands
    1. conda create -n reddit python=3.7.4 -y (this command can also be used to reset the environment by deleting the old one and reinstalling it)
    1. conda activate reddit
    1. conda install notebook dask tqdm flake8 altair black -y
    1. pip install pyarrow zstandard requests
    1. then you use this version of python to execute everything using something like atom or vscode will be able to see all of the environments
    1. to deactivate you have type conda deactivate

- below are the commands taken out of the list for easier copying

    ```PowerShell
    conda create -n reddit python=3.7.4 -y
    conda activate reddit
    conda install notebook dask tqdm flake8 altair black -y
    pip install pyarrow zstandard requests
    conda deactivate
    ```

- if you wish to remove (or uninstall) a conda environment then do the following

    ```PowerShell
    conda remove --name myenv --all
    ```

### [venv environments](https://docs.python.org/3/tutorial/venv.html)

To use venv is both a bit more complicated. launching these environments aren't as straight forward (at least on Windows) but it works pretty much the same way. Be aware that you cannot specify the version of python you use when using venv it just creates an environment for the version that you're using to load venv.

1. you first have to have python installed (the below example is using python 3.8.1)
    1. python -m venv general_use this creates the new environment
    1. general_use\Scripts\activate.bat or general_use\Scripts\activate.ps1 (if you're using powershell) this "opens" or activates this environment
    1. pip install flake8 black notebook tqdm docx2txt this installs any modules that are listed after the install command
    1. to leave the environment you can just type deactivate

    ```python
    python -m venv general_use
    general_use\Scripts\activate.ps1
    pip install flake8 black notebook tqdm docx2txt
    deactivate
    ```
