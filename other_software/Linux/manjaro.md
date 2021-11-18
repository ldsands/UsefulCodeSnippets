# Manjaro KDE

Manjaro is an arch Linux based distro that has become known for being fairly stable but has some more advanced features such as rolling releases which allow for cutting edge software.

- [Manjaro KDE](#manjaro-kde)
    - [Installing Manjaro KDE](#installing-manjaro-kde)
    - [Notes on Installation Issues](#notes-on-installation-issues)
    - [VSCode Runner](#vscode-runner)
    - [Other Tips](#other-tips)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [KDE Plasma Notes](#kde-plasma-notes)
    - [App Configurations](#app-configurations)
    - [Apps that I'm experimenting with](#apps-that-im-experimenting-with)

## Installing Manjaro KDE

- Install oh-my-zsh, git, Kitty (a Konsole replacement) setup yay for installing from AUR and install MS Edge (beta).

    ```sh
    # installs oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    # this makes it so you don't have to sign in every time you do anything with Github
    git config --global credential.helper store
    # install yay and other dependencies needed to instal and build AUR packages
    sudo pacman -Sy base-devel git yay
    # Install Kitty
    sudo pacman -S kitty
    # change the ctrl+shift to ctrl in Kitty along with some other settings more can be found [here](https://sw.kovidgoyal.net/kitty/conf/)
    echo "
    kitty_mod ctrl
    background_opacity 0.6
    :     font_family      FiraCode Nerd Font Mono
    " >> ~/.config/kitty/kitty.conf
    # enable auto correction (you also need to enable the plugin which is below)
    sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # enable syntax highlighting (you also need to enable the plugin which is below)
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # add plugins - python related (python, pip) - zsh related (zsh-autosuggestions)
    sed -i 's/plugins=(git)/plugins=(\n)/g' ~/.zshrc
    sed -i '/^plugins=(/a \    git\n    python\n    pip\n    z\n    command-not-found\n    zsh-autosuggestions\n    zsh-syntax-highlighting' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
    # restart the shell
    exec zsh
    # Install MS Edge (beta)
    yay -S microsoft-edge-beta-bin
    ```

- Install Microsoft Edge Beta which is my browser of choice. I install this pretty much so quickly because it allows me to access my email quickly so that I can then sign into and activate other software.
    - After Edge is installed I go to "Settings" and then "Appearance". Under "Customize Appearance" I select "Dark" mode. I then select "Downloads Button" under "Select which buttons to show on toolbar" to show the download button on the toolbar.
    - I also hide all of the visible extensions by selecting the "Extensions Button" and clicking on the "eye" icon for all of the extensions except the Zotero Connector and Enpass Extension
    - I then also "Pin" several tabs so that they load automatically on launching Edge. Mostly email tabs and other typing practice tabs (I'm trying to get faster).
- Install Enpass which is my password manager.
<!-- - Install Github cli and login
    - More details on how to get Github commits may be needed I got some help from [this YouTube video](https://www.youtube.com/watch?v=ZeKytARUnTo)
    - You can also use an environment variable called GH_TOKEN and use a personal token for authentication

    ```sh
    # install github cli
    sudo pacman -S github-cli
    # start Github login
    gh auth login
    # select Github.com
    # select HTTPS
    # you can then enter a token or use a browser to login
    ``` -->

- Install VSCode
    - VSCode is my text editor/IDE of choice
    - I also install the [VSCodeProjectsRunner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it. You may have to reboot to have it start working after the installation.

    ```sh
    # add some dependencies for signing into VSCode
    echo "
    # see https://unix.stackexchange.com/a/295652/332452
    source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

    # see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
    eval $(/usr/bin/gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK

    # see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
    mkdir -p "$HOME"/.local/share/keyrings" >> ~/.xinitrc
    sudo pacman -S gnome-keyring libsecret libgnome-keyring
    # install fonts for VSCode
    sudo pacman -S zip unzip
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip && unzip CascadiaCode.zip && sudo fc-cache -f -v
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v
    # Install VSCode
    yay -S visual-studio-code-bin
    # sudo pacman -S krunner-vscodeprojects 
    yay -S krunner-vscodeprojects-git
    ```

- I use pCloud to sync all of my files across devices and to keep all of my files backed up. The executable file can be downloaded using [this link](https://www.pcloud.com/download-free-online-cloud-file-storage.html). This is an appimage file which means it should be able to run on any Linux distro without any external dependencies.
    - When I execute this file it should prompt to move the file to another location. I accept this prompt which allows pCloud to start automatically on system startup.
    - I then sign in and select the "Sync" tab and then select the "Add New Sync" button. I select for the local folder `home/ldsands/Documents/pCloudLocal` and for the pCloud Drive folder `/pCloudLocal`.
    - The Baloo file extractor will cache all files for searches however that is not a good idea for pCloud or Zotero local storage. More information can be found [here](https://community.kde.org/Baloo/Configuration#Exclude_Folders). To stop this use the command below:

        ```sh
        echo 'exclude folders[$e]=$HOME/pCloudDrive/,$HOME/Zotero/
        ' >> ~/.config/baloofilerc
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
        # Discord - Messaging, Voice, and Video Client
        flatpak install flathub com.discordapp.Discord -y
        # Zoom - Video Conferencing, Web Conferencing, Webinars, Screen Sharing
        flatpak install flathub us.zoom.Zoom -y
        # Chromium Web Browser - The web browser from Chromium project
        flatpak install flathub org.chromium.Chromium -y
        # Inkscape - Vector Graphics Editor
        flatpak install flathub org.inkscape.Inkscape -y
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

- Install [OBS Studio](https://obsproject.com/) and [OBS-BackgroundRemoval](https://github.com/royshil/obs-backgroundremoval)
    - When installing the `linux-headers` make sure you install the correct kernel number that matches the Kernel you're running
    - You'll then want to restart after installing the `linux-headers` and `v4l2loopback-dkms`

    ```sh
    # get linux kernel version
    uname -r
    # install v4l2loopback which is needed for virtual camera
    sudo pacman -S linux-headers v4l2loopback-dkms
    # reboot computer
    sudo reboot
    # install obs and background removal
    yay -S obs-studio obs-backgroundremoval
    # yay -S obs-studio obs-backgroundremoval
    ```

## Notes on Installation Issues

- If there is no audio device then install the audio firmware using the command below then restart the computer.

    ```sh
    sudo pacman -S sof-firmware
    ```


## VSCode Runner

```sh
sudo pacman -S krunner-vscodeprojects
```

## Other Tips

- yay is used to help install packages from AUR

    ```sh
    # to update everything just use yay
    yay
    # to cleanup unneeded dependencies
    yay -Yc
    # to search for a package
    yay edge
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
- [Android Apps on Linux](https://anbox.io/) instructions can be found [here](https://www.howtogeek.com/760044/how-to-run-android-apps-on-linux/) [here is a list of other alternatives](https://linuxhint.com/android_apps_games_linux/#:~:text=Best%20Way%20to%20Run%20Android%20Apps%20and%20Games,Genymotion.%20...%204%20Android-x86.%20...%20More%20items...%20)
