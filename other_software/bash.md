# Bash/Zsh Shell

- [Bash/Zsh Shell](#bashzsh-shell)
    - [Resources](#resources)
    - [Useful Bash/zsh Concepts](#useful-bashzsh-concepts)
    - [Useful Bash/zsh Commands](#useful-bashzsh-commands)
        - [WSL Setup](#wsl-setup)
    - [Ubuntu Setup](#ubuntu-setup)
    - [Alpine Setup](#alpine-setup)

Bash is a command shell for unix systems and is the most popular shell used in Linux systems. Zsh is another unix shell that has a ton of useful features not included in Bash, for a list of Zsh features see [this page](https://github.com/hmml/awesome-zsh).

## Resources

- [Wikipedia - Good overview](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)

## Useful Bash/zsh Concepts

- to get to different drives that are mounted you can use the code below. Just replace driveLetter with the drive letter you want to use.
    - Note that WSL automatically mounts external drives

    ```sh
    # navigate to the drive letter you want to move to
    cd /mnt/d
    ```

- Aliases are commands that are typed and then expanded to whatever the user wants it to be. It follows this format `alias [flag] [custom-alias]="[command]"` below is an example
    - To make an alias persistent you need to add it to your profile file, you will also have to restart the shell after that to use the alias. An example of that is on the second line of the code block below

    ```sh
    alias FrequentFolder="cd /mnt/c/user/location/directory"
    echo 'alias FrequentFolder="cd /mnt/c/user/location/directory"' >> ~/.zshrc
    exec "$SHELL"
    ```

- Environment variables are variables that are meant to store different pieces of information (often strings) for use elsewhere. Examples might include a token that is personal to you: you can set the environment variable on your computer and  reference it easily in code but do so without exposing your personal token. To do this in python you can see [an example](../programming_languages/python/python_commands.md#random-useful-commands).
    - Below is an example of the directory for some file that I use often using modelFile invokes the path to that file.
    - The second example is setting a token as an environment variable.

    ```sh
    # assign the directory below to the environment variable `modelFile`
    export modelFile="/mnt/f/RedditData/ML_models/"
    # this will add the same variable to the zsh profile file for use after reboots
    echo 'export modelFile="/mnt/f/RedditData/ML_models/"' >> ~/.zshrc
    # this adds the token for publishing from poetry to PyPI
    export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"
    # and again the persistent version
    echo 'export POETRY_PYPI_TOKEN_PYPI="pypi-ThisWillBeRandomCharactersForYourToken"' >> ~/.zshrc
    ```

- sed is a stream editor that you can use to edit text files quickly and easily from the command line. Here are a couple of resources to get started [short and sweet](https://www.maketecheasier.com/what-is-sed/) and a much more [comprehensive guide](https://www.grymoire.com/Unix/Sed.html#uh-53). There are several examples under the [WSL Setup section](#wsl-setup) of this document. This is more capable then the echo command that I often use because sed can for example find a line and replace it.

## Useful Bash/zsh Commands

- restart your bash or zsh shell
    - or it seem like you can just type in the other shell and then do the other shell again and it'll restart your shell, so if you start in zsh and want to restart it you can type in `bash` then type in `zsh` and that seems to restart the `zsh` shell

    ```sh
    exec "$SHELL"
    ```

- To see all of the files in a directory you can use `ls` however if you also want to see the hidden files you need to use `ls -a`
- To enable ssh passwordless access to another linux computer you can do the following:
    - First create the generated keys `ssh-keygen -t rsa`
    - Then copy over the keys to the destination computer `ssh-copy-id -i ~/.ssh/id_rsa.pub username@computerdomain`
    - More details can be found [here](https://wiki.uiowa.edu/display/hpcdocs/Setting+Up+Passwordless+Login) and [here](https://www.hanselman.com/blog/HowToSetUpATabProfileInWindowsTerminalToAutomaticallySSHIntoALinuxBox.aspx) for how to do something similar from a Windows computer

### WSL Setup

To set up WSL follow the instructions I've set [up here](windows_program_instructions/windows_programs.md/#wsl-windows-subsystem-for-linux).

Now to get bash all set up with useful features do the following steps:

1. install zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default) or [here for WSL specifically](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903)
1. install Oh My Zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

- Other sources I used while doing this
    - [link 1](https://www.sitepoint.com/zsh-tips-tricks/) [link 2](https://pascalnaber.wordpress.com/2019/10/05/have-a-great-looking-terminal-and-a-more-effective-shell-with-oh-my-zsh-on-wsl-2-using-windows/) [link 3](https://nickymeuleman.netlify.app/blog/linux-on-windows-wsl2-zsh-docker#zsh) [link 4](https://www.sitepoint.com/zsh-tips-tricks/).
- for a list of pre-installed plugins look [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview)

## Ubuntu Setup

Below are the step I take to setup my linux shell the way I like it in various steps. Note that this is applicable to Ubuntu but will work on other distros with minimal changes.

- install the basics: update apt-get, git, zsh, and ohmyzsh

    ```sh
    # get into administrator mode
    sudo apt-get update
    # install git
    sudo apt install git
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "Prename Name"
    git config --global user.email "email@example.com"
    # install zsh
    sudo apt install zsh -y
    # test to see if zsh is installed
    zsh --version
    # start zsh and select the option with the default settings
    zsh
    # setup the default settings
    2
    # logout of the shell and restart it
    exec "$SHELL"
    # install Oh My Zsh and enter Y after to make zsh the default shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exec "$SHELL"
    ```

    ```sh
    # this allows you to open the configuration file with vs code
    code ~/.zshrc
    # change the blue in the prompt bar to be easier to read
    # sed -i '0,/blue/{s/blue/39d/}' ~/.oh-my-zsh/themes/agnoster.zsh-theme
    # enable auto correction (you also need to enable the plugin which is below)
    sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # enable syntax highlighting (you also need to enable the plugin which is below)
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # add plugins - python related (python, pip) - zsh related (zsh-autosuggestions)
    sed -i 's/plugins=(git)/plugins=(\n)/g' ~/.zshrc
    sed -i '/^plugins=(/a \    git\n    python\n    pip\n    poetry\n    z\n    command-not-found\n    zsh_reload\n    zsh-autosuggestions\n    zsh-syntax-highlighting\n   ssh-agent' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
    # restart the shell
    exec "$SHELL"
    ```

    ```sh
    # setup python, pyenv, virtualenv, and poetry
    # you also need these for using pyenv
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
    # install pyenv and put into the PATH
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    sudo git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    # install venv for environment mangagement backend
    sudo apt-get install python3-venv -y
    # install poetry for python management
    sudo apt-get install python-is-python3
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
    echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.zshrc
    echo 'if [[ -z "$VIRTUAL_ENV" ]]; then
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi' >> ~/.zshrc
    mkdir $ZSH/plugins/poetry
    exec "$SHELL"
    poetry completions zsh > $ZSH/plugins/poetry/_poetry
    # install python using pyenv
    pyenv install 3.8.3
    # set this version to the global version of python
    pyenv global 3.8.3
    # see the version that was installed
    pyenv versions
    # install pipx and install virtualenv using pipx
    sudo apt install pipx
    pipx install virtualenv
    pipx ensurepath
    exec "$SHELL"
    # create example virtual environment using pyenv-virtualenv
    <!-- pyenv virtualenv TestEnv -->
    # set this environment to global and activates it
    <!-- pyenv global TestEnv -->
    ```

- the theme I like to use is called [Powerlevel10k](https://github.com/romkatv/powerlevel10k#powerlevel10k) it is very powerful and customizable. Instructions for my set up are included below.

    ```sh
    # set the theme for Oh My Zsh the agnoster option is already installed the powerlevel10k has to be downloaded and installed
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc
    # restart your shell
    exec "$SHELL"
    # configuration options
    y
    y
    y
    n
    3
    1
    2
    2
    1
    1
    2
    3
    1
    1
    1
    1
    2
    n
    3
    y
    ```

- SSH allows for you to access this computer while using another computer. I use it mostly for using VSCode from another computer. In this case from Windows that is hosting the WSL Ubuntu Distro that I use this in. There is a PowerShell command that must be run to allow the port to connect to Windows however it has to be done in Windows PowerShell not PowerShell.

    ```sh
    sudo apt remove openssh-server
    sudo apt install openssh-server
    sudo sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
    sudo sed -i '/#Port 22/c\Port 2200' /etc/ssh/sshd_config
    echo "# for making sure that the ssh server works" >> ~/.zshrc
    echo 'eval "sudo service ssh --full-restart"' >> ~/.zshrc
    sudo apt install net-tools
    sudo service ssh --full-restart
    ifconfig
    # to see if the ssh server is running use the following command
    service ssh status
    # Windows firewall ssh port configuration which must be done in Windows PowerShell
    New-NetFirewallRule -DisplayName 'SSH-WSL-Inbound' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Allow -Protocol TCP -LocalPort @('2200')
    # config file for vscode just copy this in with the correct HostName, User, and replace the %username%
    Host 127.0.0.1
      HostName 127.0.0.1
      User ldsands
      Port 2200
      IdentityFile C:\Users\%username%\.ssh\id_rsa
    # add the folowing lines to your z
    ```

    ```sh
    # to create identity keys so that passwords don't have to be entered do the following in PowerShell
    ssh-keygen
    type c:\users\%username%\.ssh\id_rsa.pub | ssh username@hostname 'cat >> .ssh/authorized_keys'
    # now enter this into the Ubuntu shell
    chmod 600 ~/.ssh/id_rsa
    sudo service ssh --full-restart
    ```

## Alpine Setup

```sh
apk add zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
