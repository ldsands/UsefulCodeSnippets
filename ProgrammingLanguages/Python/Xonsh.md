# Xonsh

[Xonsh](https://xon.sh/) "is a Python-powered shell"

- [Xonsh](#xonsh)
    - [Xonsh Installation](#xonsh-installation)
        - [Linux Installation Notes](#linux-installation-notes)
        - [Windows Installation Notes](#windows-installation-notes)
    - [Xontribs](#xontribs)
    - [Xonsh Setup](#xonsh-setup)

## Xonsh Installation

### Linux Installation Notes

- to install on Linux:

    ```sh
    # on Ubuntu
    sudo apt install xonsh
    # on Arch Linux/Manjaro
    yay -S xonsh
    ```

- If installing on WSL make sure that you add the code below is added to the wsl config file that can be opened in VSCode using the following command: `code ~/.wslconfig`

    ```config
    [interop]
    appendWindowsPath=false
    ```

- to set as default shell see below or [this url](https://xon.sh/customization.html?highlight=default#set-xonsh-as-my-default-shell)

    ```sh
    # First ensure that xonsh is on your $PATH
    which xonsh
    # Then, as root, add xonsh to the shell list (this may fail not sure why)
    sudo which xonsh >> /etc/shells
    # To change shells, run
    chsh -s $(which xonsh)
    # You will have to log out and log back in before the changes take effect.
    # then you can run the setup wizard
    xonfig wizard
    # to load the xonsh config file using VSCode
    code ~/.xonshrc
    ```

### Windows Installation Notes

- You should install pyenv-win first more details about how to do that can be found [here](PythonInstall.md#pyenv-on-windows)
    - You can then install python and set a global python version to use to install Xonsh (commands for this are below)
    - You will also need to disable the python app alias in Windows you can do that by searching for "Manage app execution aliases" then deselect the two python aliases. More details can be found [here on stackoverflow](https://stackoverflow.com/a/58773979/8396684)

    ```PowerShell
    # install python version 3.10.8 (in this example)
    pyenv install 3.10.8
    # set this version of python as the global default version of python
    pyenv global 3.10.8
    # install xonsh using pipx
    # upgrade pip
    python -m pip install --upgrade pip
    ```

    - Install xonsh

    ```PowerShell
    pip install xonsh[full]
    ```

    - To install xonsh using pipx see below. I do not recommend this as of 2022-11-18 on windows due to some subprocess mode issues ([issue 4566](https://github.com/xonsh/xonsh/issues/4566) [issue 4886](https://github.com/xonsh/xonsh/issues/4886)).

    ```PowerShell
    # install pipx
    pip install pipx
    pipx install 'xonsh[full]'
    # you may then have to restart your shell
    pipx runpip xonsh install readline
    ```

## Xontribs

- [Vox](https://xon.sh/python_virtual_environments.html?highlight=vox) comes with Xonsh and is used for managing virtual environments

## Xonsh Setup

- To setup Xonsh do the following

    ```PowerShell
    # launch xonsh
    xonsh
    # create the `.xonshrc` file using VSCode (and open it in)
    cd ~ && code .xonshrc 
    # to setup the xonfig file using the web use this command (I've never really got it to work well)
    xonfig web
    ```
