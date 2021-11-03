# Kubunbu

Kubunbu is a "flavor" of Ubuntu that uses KDE Plasma instead of GNOME for the desktop environment. This file will cover options and setup of Kubunbu.

- [Kubunbu](#kubunbu)
    - [Kubunbu Installation](#kubunbu-installation)
    - [General Linux (Ubunbu flavors) Setup](#general-linux-ubunbu-flavors-setup)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [KDE Plasma Notes](#kde-plasma-notes)
    - [App Configurations](#app-configurations)
    - [Apps that I'm experimenting with](#apps-that-im-experimenting-with)

## Kubunbu Installation

- For installing on a USB drive you have to follow additional steps. There is a great article about this on [It's Foss](https://itsfoss.com/intsall-ubuntu-on-usb/).
- If you're dual booting Linux can cause issues with the time setting on Windows. The easiest way to deal with this is by using this command in Linux: `timedatectl set-local-rtc 1 --adjust-system-clock` this tells Linux that the motherboard time is in local time. To check if it worked enter `timedatectl` into ther terminal and if "RTC in local TZ:" is yes then there won't be an issue with the time settings on Windows.

## General Linux (Ubunbu flavors) Setup

- Install the basics: update apt-get, git, zsh, ohmyzsh

    ```sh
    # get into administrator mode and update everything
    sudo apt-get update && sudo apt-get upgrade -y
    # install git
    sudo apt install git -y
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
    # install curl for downloading files
    sudo apt install curl -y
    # install Oh My Zsh and enter Y after to make zsh the default shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exec "$SHELL"
    ```

- Install [Hyper](https://tabby.sh/)
    - download the `.deb` file from [the github releases page](https://github.com/vercel/hyper/releases) then you can double click on file to install it.
    - to edit the configurations I open the config file in VSCode with this command: `code ~/.hyper.js`
    - I then replace the default configuration file with the contents from [this file](https://gist.githubusercontent.com/ldsands/8f29321220601ae2274fd769487f5713/raw/d08f18f811f7fc12de74ad4d30fa1fb560de761c/.hyper.js)

- [Install Microsoft Edge Beta](https://www.microsoftedgeinsider.com/en-us/download/) which is my browser of choice.

    ```sh
    ## Setup
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
    sudo rm microsoft.gpg
    ## Install
    sudo apt update
    sudo apt install microsoft-edge-beta
    ```

- Stuff needed for VSCode
    - Go to the [VSCode website](https://code.visualstudio.com/) and download and then select ther `.deb` file to download. Then you can double click on the file to install VSCode
    - If there is an issue with signing into settings sync then VSCode needs "gnome-keyring" from GNOME that Kubuntu doesn't include by default`sudo apt install -y gnome-keyring`
    - To install some of the nerd fonts (for VSCode and Terminals) you can use the following options:
        - To install FiraCode NF Regular use these commands: `mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true && sudo fc-cache -f -v`
        - To install Caskaydia Cove Regular use these commands: `mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && curl -fLo "Caskaydia Cove Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.otf?raw=true && sudo fc-cache -f -v`
    - Install the [VSCodeProjectsRunner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it.

        ```sh
        sudo apt-get update
        sudo apt install cmake extra-cmake-modules build-essential libkf5runner-dev libkf5textwidgets-dev qtdeclarative5-dev gettext -y 
        curl https://raw.githubusercontent.com/alex1701c/krunner-vscodeprojects/master/install.sh | bash
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
    sed -i '/^plugins=(/a \    git\n    python\n    pip\n    z\n    command-not-found\n    zsh-autosuggestions\n    zsh-syntax-highlighting' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
    echo '\n' >> ~/.zshrc
    # restart the shell
    exec "$SHELL"
    ```

- Install Flatpak (which is a app focused package manager for Linux) [these instructions are for Kubunbu only](https://flatpak.org/setup/Kubuntu/) it is slightly different for Ubuntu. To find apps to install you can go to [Flathub](https://flathub.org/home) which is where Flatpak apps are hosted for easy access and browsing.

    ```sh
    # Install Flatpak
    sudo apt install flatpak
    # Install the Discover Flatpak backend
    sudo apt install plasma-discover-flatpak-backend
    # Add the Flathub repository
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ```

    - Install flatpak/flathub hosted apps:
        - Apps I install on every computer

            ```sh
            # Telegram Desktop messenger
            flatpak install flathub org.telegram.desktop -y
            # PeaZip - Free file archiver utility, open, extract RAR TAR ZIP archives
            flatpak install flathub io.github.peazip.PeaZip -y
            # Spotify - Online music streaming service
            flatpak install flathub com.spotify.Client -y
            # Todoist: To-Do List & Tasks "The best to-do list app right now" - The Verge
            flatpak install flathub com.todoist.Todoist -y
            # VLC - VLC media player, the open-source multimedia player
            flatpak install flathub org.videolan.VLC -y
            # Discord - Messaging, Voice, and Video Client
            flatpak install flathub com.discordapp.Discord -y
            # Zoom - Video Conferencing, Web Conferencing, Webinars, Screen Sharing
            flatpak install flathub us.zoom.Zoom -y
            # Chromium Web Browser - The web browser from Chromium project
            flatpak install flathub org.chromium.Chromium -y
            # OBS Studio - Live streaming and video recording software
            flatpak install flathub com.obsproject.Studio -y
            # Inkscape - Vector Graphics Editor
            flatpak install flathub org.inkscape.Inkscape -y
            ```

    - To uninstall any Flatpak app use uninstall instead of install such as seen here: `flatpak uninstall flathub org.inkscape.Inkscape -y`

- Install pyenv for managing python

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
    eval "$(pyenv init -)"
    ' >> ~/.zshrc
    # restart shell so new path variables can be used
    exec zsh
    # install the pyenv-update plugin so that pyenv and its plugins can be easily updated using `pyenv update`
    git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
    # restart shell so new path variables can be used
    exec zsh
    # update pyenv
    pyenv update
    # install python using pyenv
    pyenv install 3.9.7
    # set this version to the global version of python
    pyenv global 3.9.7
    # see the version that was installed
    pyenv versions
    ```

## KDE Plasma Setup

- Settings to change
    - Appearance; Global Theme; select "Breeze Dark"
    - Applications; Default Applications; Web Browser: select Microsoft Edge (beta)
    - Custom Shortcuts; Maximize Window: `meta+home`
    - Custom Shortcuts; KRunner: `meta+space`
    - KRunner:
        - Unselect "Browser History"
        - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
- Virtual Desktops and Activities
    <!-- - Workspace Behavior; Virtual Desktops TODO: -->
    <!-- - Workspace Behavior; Activities TODO: -->
- Panel
    - Right click on ther panel (called taskbar on Windows) and select "Edit Panel..."
    - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"; Then select "Behavior"; for "Groups" select "Do not group" and for "Show Only Tasks" select "From Current Screen"
    - On the right screen I add the widget "Pager" just to the left of the "System Tray"
        - Also I configure the widget "Text Display"; "Desktop Name"
    - On the left screen I add the widget "Activity Pager" just to the left of the "System Tray"
        - Also I configure the widget "Text Display"; "Activity Name"

## KDE Plasma Notes

- Sometimes Plasma needs to be restarted. Use these commands to kill and then restart Plasma: `killall plasmashell && kstart5 plasmashell`

## App Configurations

- Microsoft Edge (Beta)
    - Sign in using Microsoft Account
    - Create PWA from my Outlook Accounts:
        - Open the "Applicaion Launcher" (like the start button from Windows); search for "Outlook (PWA)"; right click on the result; Select "Applicaion" tab;
        - Select the ellipsis menu in the upper right; select permissions; next to "Notifications" Select "Allow"

## Apps that I'm experimenting with

```sh
# gThumb Image Viewer - View and organize your images
flatpak install flathub org.gnome.gThumb -y
# Evolution - Manage your email, contacts and schedule
flatpak install flathub org.gnome.Evolution -y
# Disk Usage Analyzer - Check folder sizes and available disk space
flatpak install flathub org.gnome.baobab -y
```

- Install [Tabby](https://tabby.sh/)
    - download the `.deb` file from [the github releases page](https://github.com/Eugeny/tabby/releases)
