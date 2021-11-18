# KDE Neon

KDE Neon is a "flavor" of Ubuntu that uses KDE Plasma instead of GNOME for the desktop environment. It is officially supported by the KDE team and is not an "official" flavor of Ubuntu. This file will cover options and setup of KDE Neon.

- [KDE Neon](#kde-neon)
    - [KDE Neon Installation](#kde-neon-installation)
    - [General Setup](#general-setup)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [KDE Plasma Notes](#kde-plasma-notes)
    - [App Configurations](#app-configurations)
    - [Apps that I'm experimenting with](#apps-that-im-experimenting-with)

## KDE Neon Installation

- For installing on a USB drive you have to follow additional steps. There is a great article about this on [It's Foss](https://itsfoss.com/intsall-ubuntu-on-usb/).
- If you're dual booting Linux can cause issues with the time setting on Windows. The easiest way to deal with this is by using this command in Linux: `timedatectl set-local-rtc 1 --adjust-system-clock` this tells Linux that the motherboard time is in local time. To check if it worked enter `timedatectl` into the terminal and if "RTC in local TZ:" is yes then there won't be an issue with the time settings on Windows.

## General Setup

- [Install Microsoft Edge Beta](https://www.microsoftedgeinsider.com/en-us/download/) which is my browser of choice. I install this pretty much so quickly because it allows me to access my email quickly so that I can then sign into and activate other software.

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

    - After Edge is installed I go to ["Settings" and then "Appearance"](edge://settings/appearance). Under "Customize Appearance" I select "Dark" mode. I then select "Downloads Button" under "Select which buttons to show on toolbar" to show the download button on the toolbar.
    - I also hide all of the visible extensions by selecting the "Extensions Button" and clicking on the "eye" icon for all of the extensions except the Zotero Connector and Enpass Extension
    - I then also "Pin" several tabs so that they load automatically on launching Edge. Mostly email tabs and other typing practice tabs (I'm trying to get faster).

- Install [Hyper](https://hyper.is/)
    - download the `.deb` file from [the github releases page](https://github.com/vercel/hyper/releases) then you can double click on file to install it.
    - to edit the configurations I open the config file in VSCode with this command: `code ~/.hyper.js`
    - I then replace the default configuration file with the contents from [this file](https://gist.githubusercontent.com/ldsands/8f29321220601ae2274fd769487f5713/raw/d08f18f811f7fc12de74ad4d30fa1fb560de761c/.hyper.js)

- Install [Enpass](https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/) which is my password manager.

    ```sh
    # To install Enpass, add a new repository to /etc/apt/sources.list:
    sudo -i
    echo "deb https://apt.enpass.io/ stable main" > \
    /etc/apt/sources.list.d/enpass.list
    # And import key that is used to sign the release:
    wget -O - https://apt.enpass.io/keys/enpass-linux.key | tee /etc/apt/trusted.gpg.d/enpass.asc
    # After that, you can install Enpass as any other software package:
    apt-get update
    apt-get install enpass
    exit
    ```

- I use pCloud to sync all of my files across devices and to keep all of my files backed up. The executable file can be downloaded using [this link](https://www.pcloud.com/download-free-online-cloud-file-storage.html). This is an appimage file which means it should be able to run on any Linux distro without any external dependencies.
    - I move this file into `Documents/StartupPrograms` then I select it and allow the file to execute. It should start on system startup as well.
    - I then sign in and select the "Sync" tab and then select the "Add New Sync" button. I select for the local folder `home/ldsands/Documents/pCloudLocal` and for the pCloud Drive folder `/pCloudLocal`.
    - The Baloo file extractor will cache all files for searches however that is not a good idea for pCloud or Zotero local storage. More information can be found [here](https://community.kde.org/Baloo/Configuration#Exclude_Folders). To stop this use the command below:

        ```sh
        echo 'exclude folders[$e]=$HOME/pCloudDrive/,$HOME/Zotero/
        ' >> ~/.config/baloofilerc
        ```

- Change "Default Applications" in "System Settings." I change "Web browser" to "Microsoft Edge (Beta)" and I change "Terminal emulator" to "Hyper."

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
    exec zsh
    # install curl for downloading files
    sudo apt install curl -y
    # install Oh My Zsh and enter Y after to make zsh the default shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exec zsh
    ```

- Stuff needed for VSCode
    - Go to the [VSCode website](https://code.visualstudio.com/) and download and then select the `.deb` file to download. Then you can double click on the file to install VSCode
    - If there is an issue with signing into settings sync then VSCode needs "gnome-keyring" from GNOME that KDE doesn't include by default`sudo apt install -y gnome-keyring`
    - To install some of the nerd fonts (for VSCode and Terminals) you can use the following options:
        - To install FiraCode NF Regular use these commands: `mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true && sudo fc-cache -f -v`
        - To install Caskaydia Cove Regular use these commands: `mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && curl -fLo "Caskaydia Cove Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.otf?raw=true && sudo fc-cache -f -v`
    - Install the [VSCodeProjectsRunner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it.
        - First the dependencies need to be installed with this command: `sudo apt install cmake extra-cmake-modules build-essential libkf5runner-dev libkf5textwidgets-dev qtdeclarative5-dev gettext -y`
        - After you've done that open "System Settings" and go to "KRunner." Click on the "Get New Plugins..." button in the lower right. Search for "VSCodeProjectsRunner" and click install in the upper right of the box. If Hyper is already set as the default terminal you will need to change it back to Konsole to install this.

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
    exec zsh
    ```

- Install Flatpak (which is a app focused package manager for Linux) [these instructions are for Kubunbu](https://flatpak.org/setup/Kubuntu/) however KDE Neon is also a Ubunbu based distro with KDE. To find apps to install you can go to [Flathub](https://flathub.org/home) which is where Flatpak apps are hosted for easy access and browsing.

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
            # Zotero - Collect, organize, cite, and share research
            flatpak install flathub org.zotero.Zotero -y
            # SpeedCrunch - A high-precision scientific calculator
            flatpak install flathub org.speedcrunch.SpeedCrunch -y
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
    - You can also update flatpak by using this command: `sudo flatpak update`

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

- Setup of various other command line utilities I use

    ```sh
    # install rust for installation of many of the following utilities
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # restart shell to access rust
    exec zsh
    rustup update
    # A cc compiler is needed to compile these rust applications
    sudo apt install build-essential
    # installation of bottom which is a system resource manager (required rust)
    rustup update stable
    cargo install bottom
    # use bottom by typing in `btm`
    # installation of exa which is a replacement for ls (required rust)
    rustup update stable
    cargo install exa
    # use exa by typing in `exa` I usually use `exa --long --header --group-directories-first -F`
    # use exa by typing in `exa` I usually use `exa --long --header --group-directories-first -R -T -F -L=2` to see files in folders
    # this installs starship which is a cross platform/shell prompt
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    # create bottom and starship config files
    mkdir -p ~/.config && mkdir -p ~/.config/bottom/
    # copy my configuration from my gists to the bottom.toml and starship.toml files
    cd ~/.config/bottom/ && wget ‐‐directory-prefix=~/.config/bottom/bottom.toml https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/6aeadc8d1ba513c4008789bbaf96679caf9555af/bottom.toml
    cd ~/.config/ && wget ‐‐directory-prefix=~/.config/starship.toml https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/a975bad49c61e290801ff663ef7df279fe0a96a9/starship.toml
    # this adds the starship initialize command to the end of the zsh config file
    echo 'eval "$(starship init zsh)"
    ' >> ~/.zshrc
    ```

- Install [LibreOffice](https://www.libreoffice.org/)
    - Go to [the download site](https://www.libreoffice.org/download/download/) and download the .deb file. Once it has been downloaded unzip the file.
    - Now enter the "DEBS" directory and run this command: `sudo dpkg -i *.deb`

- Install Calibri font

    ```sh
    sudo apt-get update
    sudo apt-get install fontforge
    sudo apt-get install cabextract
    wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash
    # this will tell you if the Calibri fonts have been installed
    fc-list | grep Calibri
    ```

- Other random stuff to install
    - Codecs and font stuff `sudo apt-get install kubuntu-restricted-extras -y`
    - If the computer has an nvidia GPU you need to install `kubuntu-driver-manager` using `Muon` then type in the following commands:

        ```sh
        # to check for your GPU
        ubuntu-drivers devices
        # to list drivers
        ubuntu-drivers list
        # to install the correct driver
        sudo ubuntu-drivers autoinstall
        # you then need to reboot
        # generate a config file
        sudo nvidia-xconfig
        # then open nvidia settings in the GUI
        ```

## KDE Plasma Setup

System Settings to change. Open "System Settings" then you can search or find the categories listed below to edit settings.

- Appearance; Global Theme; select "Breeze Dark"
- Applications; Default Applications;
    - Web Browser: select Microsoft Edge (beta)
    - Terminal emulator: Hyper
- Shortcuts;
    - Maximize Window: `meta+home`
    - KRunner: `meta+space`
    - Switch One Desktop to the Left `meta+ctrl+left`
    - Switch One Desktop to the Right `meta+ctrl+right`
- KRunner:
    - Unselect "Browser History"
    - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
- Removable Storage; Removable Devices
    - Check "Enable automatic mounting of removable media" and "Only automatically mount removable media that has been manually mounted before"
- Workspace Behavior; General Behavior
    - Clicking files or folders; change to "Selects them"
- Virtual Desktops and Activities
    - Workspace Behavior; Virtual Desktops
        - I create two additional Virtual Desktops named `Num 01`, `Num 02` and `Num 03`
        - I also Unselect the "Navigation wraps around" option
    - Workspace Behavior; Activities
        - I create two new Activities
            - The first is called "Python" and I use for the icon `/home/ldsands/Documents/pCloudLocal/Pictures/LogoCollections/Python/python-logo-generic_cropped.svg`
            - The second is called "School" and I use for the icon `/home/ldsands/Documents/pCloudLocal/Pictures/LogoCollections/Uiowa/Uiowa-Dome-favicon-96x96.png`
        - Switching between the activities can be done using `meta+tab`
- Panel
    - Right click on the battery icon and select "Show Battery Percentage on Icon"
    - Right click on the panel (called taskbar on Windows) and select "Edit Panel..."
        - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"; Then select "Behavior"; for "Groups" select "Do not group" and for "Show Only Tasks" select "From Current Screen"
        - On the right screen I add the widget "Pager" just to the left of the "System Tray"
            - Also I configure the widget "Text Display"; "Desktop Name"
        - On the left screen I add the widget "Activity Pager" just to the left of the "System Tray"
            - Also I configure the widget "Text Display"; "Activity Name"
- Screen Locking
    - Lock screen automatically: uncheck

## KDE Plasma Notes

- Sometimes Plasma needs to be restarted. Use these commands to kill and then restart Plasma: `killall plasmashell && kstart5 plasmashell`
- I've had issues connecting my bluetooth mouse these commands found [here](https://www.makeuseof.com/manage-bluetooth-linux-with-bluetoothctl/) helped:

    ```sh
    # allows to see the status of bluetooth
    sudo systemctl status bluetooth
    # make the computer bluetooth discoverable (I'm not sure if this is needed or not)
    bluetoothctl discoverable on
    # turn on bluetooth scanning this will show available bluetooth devices
    bluetoothctl scan on
    # now pair using the mac adderss (in this format: XX:XX:XX:XX:XX:XX) of the device you want to pair
    bluetoothctl pair XX:XX:XX:XX:XX:XX
    # now connect to the device using the mac address
    bluetoothctl connect XX:XX:XX:XX:XX:XX
    # interuppt the process using either `ctrl+shift+c` or `ctrl+c`
    # not turn off bluetooth discoverable (I'm not sure if this is needed)
    bluetoothctl discoverable off
    ```

## App Configurations

- Microsoft Edge (Beta)
    - Sign in using Microsoft Account
    - Create PWA from my Outlook Accounts:
        - Open the "Applicaion Launcher" (like the start button from Windows); search for "Outlook (PWA)"; right click on the result; Select "Application" tab;
        - Select the ellipsis menu in the upper right; select permissions; next to "Notifications" Select "Allow"
- Dolphin
    - I hide the following directories from the "Places" panel: `Music`, `Pictures` and `Videos`
    - I add these directories to the "Places" panel: `pCloudDrive`, `pCloudLocal`, `ComputerStuff`, `ResearchProjects` and `Uiowa`. I also add any current project and class directories for easy access.
    - In "Configure Toolbars" I search for "Up" in "Available actions" and add it to "Current Actions" and then move it to the top.

## Apps that I'm experimenting with

```sh
# gThumb Image Viewer - View and organize your images
flatpak install flathub org.gnome.gThumb -y
# Evolution - Manage your email, contacts and schedule
flatpak install flathub org.gnome.Evolution -y
# Disk Usage Analyzer - Check folder sizes and available disk space
flatpak install flathub org.gnome.baobab -y
```

- Other terminal options because although I really like Hyper it does take a lot of RAM
    - Install [Tabby](https://tabby.sh/) another terminal
        - download the `.deb` file from [the github releases page](https://github.com/Eugeny/tabby/releases)
    - [Alacritty](https://github.com/alacritty/alacritty)
        - To install you can use the following command after installing rust. `sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 && cargo install alacritty`
        - config options can be found [here](https://github.com/alacritty/alacritty/blob/master/alacritty.yml)
    - [Wez's Terminal Emulator](https://wezfurlong.org/wezterm/install/linux.html)
    - [Kitty](https://sw.kovidgoyal.net/kitty/)

        ```sh
        # install Kitty
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
        # Create a symbolic link to add kitty to PATH
        sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin
        # Place the kitty.desktop file somewhere it can be found by the OS
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        # Update the path to the kitty icon in the kitty.desktop file
        sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
        sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
        sudo update-alternatives --config x-terminal-emulator
        ```

- [Android Apps on Linux](https://anbox.io/) instructions can be found [here](https://www.howtogeek.com/760044/how-to-run-android-apps-on-linux/) [here is a list of other alternatives](https://linuxhint.com/android_apps_games_linux/#:~:text=Best%20Way%20to%20Run%20Android%20Apps%20and%20Games,Genymotion.%20...%204%20Android-x86.%20...%20More%20items...%20)
