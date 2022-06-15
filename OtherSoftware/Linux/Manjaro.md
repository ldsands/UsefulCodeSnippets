# Manjaro KDE

Manjaro is an arch Linux based distro that has become known for being fairly stable but has some more advanced features such as rolling releases which allow for cutting edge software.

- [Manjaro KDE](#manjaro-kde)
    - [Installing Manjaro KDE](#installing-manjaro-kde)
    - [Installing Programs](#installing-programs)
    - [Notes on Installation Issues](#notes-on-installation-issues)
    - [Other Tips](#other-tips)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [KDE Plasma Notes](#kde-plasma-notes)
    - [App Configurations](#app-configurations)
    - [Apps that I'm experimenting with](#apps-that-im-experimenting-with)

## Installing Manjaro KDE

- Use [Ventoy](https://www.ventoy.net/en/index.html) to create usb bootable drives with `.iso` files. It can deal with secure boot and can install from multiple `.iso` files on one drive.

## Installing Programs

- Install the following command line stuff and Microsoft Edge
    - [oh-my-zsh](https://ohmyz.sh/) - "Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration"
    - [znap](https://github.com/marlonrichert/zsh-snap) - "The fast & light-weight Zsh plugin manager"
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
    - [Kitty](https://sw.kovidgoyal.net/kitty/) (a Konsole replacement)
    - [yay](https://github.com/Jguer/yay) for installing from AUR
    - [Microsoft Edge (beta)](https://www.microsoftedgeinsider.com/en-us/download/beta) (my preferred browser)

    ```sh
    # installs oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # if you mistype the password then zsh won't be set as the default shell this command will set zsh as the default
    chsh -s  /usr/bin/zsh
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    # this makes it so you don't have to sign in every time you do anything with Github
    # you will need to push (`git push`) a commit via terminal for this to work
    # you will need to enter your Github login and password (you must use a personal access token instead of your password)
    git config --global credential.helper 'store --file ~/.my-credentials'
    # install yay and other dependencies needed to instal and build AUR packages
    sudo pacman -S --needed git base-devel yay # this will work for Manjaro but not for other Arch based distros
    pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    # enable colors for pacman and yay
    sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
    # Install Kitty
    sudo pacman -S kitty
    # change the ctrl+shift to ctrl in Kitty along with some other settings more can be found [here](https://sw.kovidgoyal.net/kitty/conf/)
    echo "
    map ctrl+c copy_or_interrupt
    map ctrl+v paste_from_clipboard
    map ctrl+t new_tab
    map ctrl+w close_window
    map ctrl+tab next_tab
    map ctrl+shift+tab previous_tab
    background_opacity 0.6
    :     font_family      FiraCode Nerd Font Mono
    " >> ~/.config/kitty/kitty.conf
    # enable auto correction (you also need to enable the plugin which is below)
    sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # enable syntax highlighting (you also need to enable the plugin which is below)
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # add [znap](https://github.com/marlonrichert/zsh-snap) which manages oh-my-zsh plugins
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
    source zsh-snap/install.zsh
    echo '
    # Download Znap, if it is not there yet.
    [[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap
    source ~/Git/zsh-snap/znap.zsh  # Start Znap
    # [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) use `ctrl+s` to use
    znap source marlonrichert/zsh-autocomplete
    # [zsh-users](https://github.com/marlonrichert/zsh-autosuggestions)
    znap source zsh-users/zsh-autosuggestions
    # [zsh-users](https://github.com/marlonrichert/zsh-syntax-highlighting)
    znap source zsh-users/zsh-syntax-highlighting
    ' >> ~/.zshrc
    # restart the shell
    exec zsh
    # Install MS Edge (beta)
    yay -S microsoft-edge-beta-bin
    ```

- Setup Microsoft Edge Beta which is my browser of choice. I install this pretty much so quickly because it allows me to access my email quickly so that I can then sign into and activate other software.
    - After Edge is installed I go to "Settings" and then ["Appearance"](edge://settings/appearance). Under "Customize Appearance" I select "Dark" mode. I then select "Downloads Button" and "History Button" under "Select which buttons to show on toolbar" to show the download button on the toolbar.
    - I also hide all of the visible extensions by selecting the "Extensions Button" and clicking on the "eye" icon for all of the extensions except the Zotero Connector and Enpass Extension
    - I then also "Pin" several tabs so that they load automatically on launching Edge. Mostly email tabs and other typing practice tabs (I'm trying to get faster).
- Install [Enpass](https://www.enpass.io/downloads/) which is my password manager.
- Install VSCode
    - VSCode is my text editor/IDE of choice
    - I also install the [VSCode Projects Runner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it. You may have to reboot to have it start working after the installation.
    - I also install the [VSCode Workspaces Runner for KRunner](https://github.com/Merrit/vscode-runner) plugin for KRunner which allows you to open VSCode workspaces directly from KRunner. Unlike VSCode Project Runner this KRunner plugin shows recent workspaces opened in VSCode. It also does not require a VSCode extension to work.

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
    - I then sign in and select the "Sync" tab and then select the "Add New Sync" button. I select for the local folder `home/$USER/Documents/pCloudLocalLevi` and for the pCloud Drive folder `/pCloudLocalLevi`.
    - The Baloo file extractor will cache all files for searches however that is not a good idea for pCloud or Zotero local storage. More information can be found [here](https://community.kde.org/Baloo/Configuration#Exclude_Folders). If you want to see what is being indexed you can use the command `balooctl monitor`. You can get some basic status using the `balooctl status` command. The command `balooctl purge` will delete the indexed files and restart indexing. To disable baloo use `balooctl disable`. To see more command options use the `balooctl` command. To stop this use the command below:

        ```sh
        echo 'exclude folders[$e]=$HOME/pCloudDrive/,$HOME/Zotero/,$HOME/yay/,$HOME/,$HOME/.*,$HOME/*.*,$HOME/*.**
        ' >> ~/.config/baloofilerc
        ```

- Setup of various other rust-based command line utilities I use
    - [Bottom](https://github.com/ClementTsang/bottom) - "[C]ross-platform graphical process/system monitor."
        - See below for a link to a gist that contains my preferred configuration options
        - use bottom by typing in `btm`
    - [Exa](https://the.exa.website/)
        - use exa by typing in `exa` I usually use:
            - `exa --long --header --group-directories-first -F -a` to see all files and directories in the current directory (-a shows hidden files/directories)
            - `exa --long --header --group-directories-first -R -T -F -L=2` to see files in directories
        - I have some aliases that I put into my `~/.zshrc` file for easy access
            - `alias list="exa --long --header --group-directories-first -F -a"`
            - `alias listVisable="exa --long --header --group-directories-first -F"`
            - `alias listAll="exa --long --header --group-directories-first -R -T -F -L=2"`
    - [Starship](https://starship.rs/) - "The minimal, blazing-fast, and infinitely customizable prompt for any shell!"
        - This requires a [Nerd Font](https://www.nerdfonts.com/) (or similar) to work properly here is a command that installs the Fira Code Nerd Font: `mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v`
        - See below for a link to a gist that contains my preferred configuration options
    - [Zoxide](https://github.com/ajeetdsouza/zoxide#installation) - "A smarter cd command."
        - This also uses (optionally) [fzf](https://github.com/junegunn/fzf) which is, "A command-line fuzzy finder"
    - [McFly](https://github.com/cantino/mcfly) - "McFly replaces your default `ctrl-r` shell history search with an intelligent search engine that takes into account your working directory and the context of recently executed commands."

    ```sh
    # install rust for installation of many of the following utilities
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # restart shell to access rust
    exec zsh
    rustup update
    # installation of bottom which is a system resource manager (required rust)
    rustup update stable
    cargo install bottom
    # installation of exa which is a replacement for ls (required rust)
    cargo install exa
    # install zoxide
    cargo install zoxide --locked
    # install fzf which is an optional zoxide dependance
    yay -S fzf
    # install mcfly
    cargo install mcfly
    # this installs starship which is a cross platform/shell prompt
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    # create bottom and starship config files
    mkdir -p ~/.config && mkdir -p ~/.config/bottom/
    # copy my configuration from my gists to the bottom.toml and starship.toml files
    cd ~/.config/bottom/ && wget ‐‐directory-prefix=~/.config/bottom/bottom.toml https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/6aeadc8d1ba513c4008789bbaf96679caf9555af/bottom.toml
    cd ~/.config/ && wget ‐‐directory-prefix=~/.config/starship.toml https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/a2a845f29d5712d6434983316d7281fe6a088947/starship.toml
    # this adds the starship initialize command to the end of the zsh config file
    echo '# starship statement
    eval "$(starship init zsh)"
    # zoxide statement
    eval "$(zoxide init zsh)"
    # mcfly statement
    eval "$(mcfly init zsh)"
    ' >> ~/.zshrc
    ```

- Install [pyenv](https://github.com/pyenv/pyenv) and [Pipenv](https://pipenv.pypa.io/en/latest/) for managing python and python virtual environments

    ```sh
    # install pipenv
    yay -S python-pipenv
    # install poetry
    yay -S python-poetry
    # install pyenv and put into the PATH
    yay -S pyenv
    echo '
    # pyenv stuff
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # pipenv stuff
    eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
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
    # create virtual environment this will automatically use the newest version of python that pyenv installed
    py -m venv .venv
    ```

- Install flatpak/flathub hosted apps:
    - Apps I install on every computer

        ```sh
        # SpeedCrunch - A high-precision scientific calculator
        flatpak install flathub org.speedcrunch.SpeedCrunch -y
        # Telegram Desktop messenger
        flatpak install flathub org.telegram.desktop -y
        # PeaZip - Free file archiver utility, open, extract RAR TAR ZIP archives
        flatpak install flathub io.github.peazip.PeaZip -y
        # Spotify - Online music streaming service
        flatpak install flathub com.spotify.Client -y
        # Discord - Messaging, Voice, and Video Client
        flatpak install flathub com.discordapp.Discord -y
        # Chromium Web Browser - The web browser from Chromium project
        flatpak install flathub org.chromium.Chromium -y
        # AppImage Pool - A simple, modern AppImageHub Client.
        flatpak install flathub io.github.prateekmedia.appimagepool -y
        # Inkscape - Vector Graphics Editor
        flatpak install flathub org.inkscape.Inkscape -y
        # Caprine - Elegant Facebook Messenger desktop app
        flatpak install flathub com.sindresorhus.Caprine
        # Todoist: To-Do List & Tasks "The best to-do list app right now" - The Verge
        flatpak install flathub com.todoist.Todoist -y
        # Zotero - Collect, organize, cite, and share research
        flatpak install flathub org.zotero.Zotero -y
        # Evolution - Manage your email, contacts and schedule
        flatpak install flathub org.gnome.Evolution -y
        # Weather - View real-time weather forecasts and other information
        flatpak install flathub org.kde.kweather
        # TextSnatcher - Snatch Text with just a Drag
        flatpak install flathub com.github.rajsolai.textsnatcher
        ```

    - To uninstall any Flatpak app use uninstall instead of install such as seen here: `flatpak uninstall flathub org.inkscape.Inkscape -y`
    - I used to use flatpak for zoom but you can't change the virtual background so I use AUR instead. `flatpak install flathub us.zoom.Zoom -y`
- Install other applications I regularly use.

    ```sh
    # "Pomotroid is a simple and configurable Pomodoro timer."
    yay -S pomotroid-bin
    # Zoom - Video Conferencing, Web Conferencing, Webinars, Screen Sharing
    yay -S zoom
    # The standard Microsoft Fonts which helps with editing MS Office files
    yay -S ttf-ms-fonts
    # [KNotes is a program that lets you write the computer equivalent of sticky notes.](https://kontact.kde.org/components/knotes/)
    yay -S knotes
    # Xplorer a file explorer that caught my attention
    yay -S xplorer-bin
    # installs a font manager it will list all installed fonts with command `fc-list`
    yay -S fontconfig
    # this installs three Windows fonts: Calibri, Consolas, and Segoe UI (could also instal ttf-win10 for more fonts)
    yay -S ttf-windows
    # installs Fira Sans fonts
    yay -S otf-fira-sans otf-firamath
    # install pandoc and latex stuff
    yay -S pandoc texlive-core texlive-latexextra texlive-fontsextra
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

- Install [Wine](https://www.winehq.org/) so that I can use some Windows applications; namely PDF X-Change Editor and TextAloud 4. <!-- TODO: I'm still working on this. -->
    - `yay -S wine`

## Notes on Installation Issues

- If there is no audio device then install the audio firmware using the command below then restart the computer.

    ```sh
    sudo pacman -S sof-firmware
    ```

- When upgrading Manjaro will often update python as well. When it upgrades the major version (e.g. 3.9.x to 3.10.x) some python packages may be built for an earlier version of python which can cause issues. To update any packages that were built for an earlier version of python you can see the example below.
    - To see which packages are outdated (built for the old major version) use this command: `pacman -Qoq /usr/lib/python3.9`
    - To use an AUR helper (in this case yay) to update them use this command: `yay -S $(pacman -Qoq /usr/lib/python3.9) --answerclean All`

## Other Tips

- yay is used to help install packages from AUR

    ```sh
    # to update everything just use yay
    yay
    # to cleanup unneeded dependencies
    yay -Yc
    # to search for a package and then you can install from a list of search results
    yay edge
    # to install a package
    yay -S zoom
    ```

## KDE Plasma Setup

System Settings to change. Open "System Settings" then you can search or find the categories listed below to edit settings.

- "Appearance"; "Global Theme"; select "Breeze Dark"
- "Applications"; "Default Applications";
    - "Web Browser": select "Microsoft Edge (beta)"
    - "Terminal emulator": select "Kitty"
- "Shortcuts";
    - "Maximize Window": `meta+home`
    - "KRunner": `meta+space`
    - "Switch One Desktop to the Left": `meta+ctrl+left`
    - "Switch One Desktop to the Right": `meta+ctrl+right`
    - "Show Desktop Grid": `meta+tab`
    - "Spectacle"; "Capture Rectangular Region": `meta+shift+s`
    - Click the button "Add Application" select Kitty; Click "Add custom shortcut" `ctrl+shift+t`
- KRunner:
    - Deselect "Browser History"
    - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
    - Click on "Get New Plugins"; search for "VSCode Workspaces Runner" then install that plugin
- Removable Storage; Removable Devices
    - Check "Enable automatic mounting of removable media" and "Only automatically mount removable media that has been manually mounted before"
- "Workspace Behavior"; "General Behavior"
    - Clicking files or folders; change to "Selects them"
- "Workspace Behavior"
    - "Desktop Effects"
        - Search for "Desktop Grid"
            - Select the "Configure..." button
            - Set "Border width:" to 5
            - For "Desktop name alignment:" select "Top"
            - Deselect "Show buttons to alter count of virtual desktops"
            - Click on the "OK" button
    - "Screen Edges"
        - For all corners select "No Action" except:
            - The upper right corner select "Present Windows - Current Desktops"
            - The lower right corner select "Present Windows - All Desktops"
            - The lower left select "Desktop Grid"
- "Virtual Desktops"
    - "Workspace Behavior"; "Virtual Desktops"
        - I create 12 Virtual Desktops with three desktops in each of 4 rows
        - Row 1: `Random 01`, `Random 02` and `Random 03`
        - Row 2: `School 01`, `School 02` and `School 03`
        - Row 3: `Python 01`, `Python 02` and `Python 03`
        - Row 4: `Email`, `CommsMusic` and `Todo`
    - Enable "Show on-screen display when switching" and change the value to 500 ms
    - Enable "Show desktop layout indicators"
- Panel
    - Right click on the battery icon and select "Show Battery Percentage on Icon" (on computers with a battery like a laptop)
    - Right click on the clock and select "Configure Digital Clock ..." Then next to "Date format:" select "ISO Date"
    - Right click on the panel (called taskbar on Windows) and select "Edit Panel..."
        - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"; Then select "Behavior"; for "Groups" select "Do not group" and for "Show Only Tasks" select "From Current Screen"
- Desktop
    - On the right screen in the upper left hand corner I add the widget "Pager" onto the Desktop
        - I make it big enough to see all nine desktops well
        - Right click on the widget and select "Configure Pager"
            - In the "General" tab I select "Show applications icons on window outlines"
            - Also in the "General" tab I select "Text Display"; "Desktop Name"
    - On the right screen in the upper right corner I add the "Weather Report" widget
- Screen Locking
    - Lock screen automatically: uncheck

## KDE Plasma Notes

- Sometimes Plasma may need to be restarted. Use these commands to kill and then restart Plasma: `killall plasmashell && kstart5 plasmashell`
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

<!-- - Start programs in the desired virtual desktop, monitor and monitor location using a bash script. [This link helped me figure all of this out](https://unix.stackexchange.com/questions/94109/launching-applications-from-a-terminal-with-specific-window-size-and-location)
    - Create a blank text file and change the extension from `.txt` to `.sh`.
    - Figure out the terminal command to start the program you want to start. This can easily be done by finding the corresponding `.desktop` files. These are located here (`/home/$USER/.local/share/applications/`) and here (`/usr/share/applications/`). Look for the `Exec` property (there can be several of them you may want to use more than one).
    - You also need the `WM_Class` you can get this by using this command in the terminal: `xprop | grep WM_CLASS` then you need to click on the window you need.
    - Get needed window information
        - First you need to setup a window to the correct location
        - Press `alt+f3` select "More Actions" then "Configure Special Window Settings..." then press the "Detect Window Properties" button near the bottom right of the window
        - Your cursor will change, click on the window that you want to get the information from
        - Below the "Size & Position" find the "Position" and "Size" rows copy those values and any others you need (like virtual desktop)

```sh
# from https://forum.manjaro.org/t/cannot-autostart-kitty-with-latest-kde-minimal/40664/2
sleep 0.1 & kstart5 --maximize --desktop 1 --windowclass kitty kitty
kstart5 --maximize --desktop 4 --windowclass gitahead gitahead
sleep 0.2 & kstart5 --maximize --desktop 5 --windowclass code code

sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass kitty kitty
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U exec
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass Google-chrome /usr/bin/google-chrome-stable & sleep 1 && exec
sleep 0.5 && kstart5 exec --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U #this DOESN'T work
sleep 0.5 && kstart5 exec --desktop 3 --geometry 1080x1021+0+45 --windowclass Google-chrome /usr/bin/google-chrome-stable %U #this DOESN'T work
sleep 0.5 && exec kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U #this DOESN'T work - the terminal did do something but no window
sleep 0.5 && exec kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass Google-chrome /usr/bin/google-chrome-stable %U #this DOESN'T work - the terminal did do something but no window

sleep 0.5 && kstart5 --desktop 3:Music --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U #desktop options testing
sleep 0.5 && kstart5 --desktop Music --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U #desktop options testing

sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome /usr/bin/google-chrome-stable %U #this works
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass Google-chrome /usr/bin/google-chrome-stable %U #this works
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome google-chrome /usr/bin/google-chrome-stable %U #this DOESN'T work
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome google-chrome /usr/bin/google-chrome-stable #this DOESN'T work
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass google-chrome google-chrome #this DOESN'T work
sleep 0.5 && kstart5 --desktop 3 --geometry 1080x1021+0+45 --windowclass systemsettings5 systemsettings
sleep 0.5 && kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass systemsettings5 systemsettings5
sleep 0.5 && kstart5 --desktop 5 --geometry 1920x1035+1080+465 --windowclass code code
sleep 0.5 && kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 

kstart5 /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo --windowclass mstodo-nativefier-80c33e --desktop 12: Todo
kstart5 --desktop 12 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 
kstart5 --desktop 12 --windowclass "mstodo-nativefier-80c33e", "mstodo-nativefier-80c33e" /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 
kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass mstodo-nativefier-80c33e mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 
kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo %U
kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 
kstart5 --desktop 12 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo 
kstart5 --desktop 12: Todo --windowclass "mstodo-nativefier-80c33e" /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo %U
"mstodo-nativefier-80c33e", "mstodo-nativefier-80c33e"
"mstodo-nativefier-80c33e"
"mstodo-nativefier-80c33e"

kstart5 --desktop 3 --geometry 1920x1035+1080+465 --windowclass mstodo-nativefier-80c33e /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo %U
kstart5 --desktop 12 --windowclass Google-chrome /usr/bin/google-chrome-stable %U
kstart5 --desktop 12 --windowclass Google-chrome
kstart5 --desktop 12 --windowclass mstodo-nativefier-80c33e
kstart5 --desktop 12 "/home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo" --windowclass "mstodo-nativefier-80c33e", "mstodo-nativefier-80c33e"
kstart5 --desktop 12: Todo "/home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo" --windowclass "mstodo-nativefier-80c33e", "mstodo-nativefier-80c33e"
exec kstart5 --desktop 12 "/home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo"
exec kstart5 --desktop 12 /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo
exec kstart5 --desktop 12 /home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo
kstart5 konsole --desktop 12: Todo
--geometry 1080x1021+0+45
# for maximized on primary (landscaped) display
--geometry 1920x1035+1080+465
``` -->

## App Configurations

- Microsoft Edge (Beta)
    - Sign in using Microsoft Account
    - Create PWAs from my Outlook Accounts (and others):
        - Open the "Application Launcher" (like the start button from Windows); search for "Outlook (PWA)"; right click on the result; Select "Application" tab;
        - Select the ellipsis menu in the upper right; select permissions; next to "Notifications" Select "Allow"
        - I do this for my two Outlook Accounts (Personal Outlook, Uiowa Outlook, [MonkeyType](https://monkeytype.com/))
- Dolphin
    - I hide the following directories from the "Places" panel: `Music`, `Pictures` and `Videos`
    - I add these directories to the "Places" panel: `pCloudDrive`, `pCloudLocalLevi`, `ComputerStuff`, `ResearchProjects` and `Uiowa`. I also add any current project and class directories for easy access.
    - In "Configure Toolbars" I search for "Up" in "Available actions" and add it to "Current Actions" and then move it to the top.
    - In "Configure Dolphin" in the "Startup" tab:
        - I change the default startup location to `/home/$USER/Downloads` (you will need to replace $USER with your username)
        - I also unselect the "Open new folders in tabs" this is because it doesn't work well with multiple virtual desktops
- Gwenview (an Image Viewer)
    - "Configure Keyboard Shortcuts"
        - "Open Containing Folder" select "Custom" enter the Keyboard shortcut of `ctrl+e, ctrl+e`
        - Under "File" next to "Quit" click under "Alternate" select the button labeled "None" then enter `ctrl+w`; select "OK" at the bottom of the dialogue box
- LibreOffice
    - It seems like when LibreOffice is in dark mode it doesn't automatically change the icons so they are very difficult to see. To change this select "Tools" then "Options" then under "LibreOffice" select "View"
        - Under "Icon style:" select "Breeze (SVG + dark)" then click the "Apply" button.
    - I also prefer the "ribben" style of user interface. To change to the ribbon ui go to "View" then "User Interface..." Then select "Tabbed"

## Apps that I'm experimenting with

- Other terminal options because although I really like Hyper it does take a lot of RAM
    - Install [Tabby](https://tabby.sh/) another terminal
        - download the `.deb` file from [the github releases page](https://github.com/Eugeny/tabby/releases)
    - [Alacritty](https://github.com/alacritty/alacritty)
        - To install you can use the following command after installing rust. `sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 && cargo install alacritty`
        - config options can be found [here](https://github.com/alacritty/alacritty/blob/master/alacritty.yml)
    - [Wez's Terminal Emulator](https://wezfurlong.org/wezterm/install/linux.html)
- [Android Apps on Linux](https://anbox.io/) instructions can be found [here](https://www.howtogeek.com/760044/how-to-run-android-apps-on-linux/) [here is a list of other alternatives](https://linuxhint.com/android_apps_games_linux/#:~:text=Best%20Way%20to%20Run%20Android%20Apps%20and%20Games,Genymotion.%20...%204%20Android-x86.%20...%20More%20items...%20)
- [Paru](https://github.com/morganamilo/paru) this is a lot like yay but written in Rust and I have a lot of other Rust based command line programs that I use so I may switch to it at some point. Yay does install much easier in Manjaro since they have it in their repo so for now I'll stick with yay.
    - To install you can use pacman: `sudo pacman -S --needed base-devel` and then you can either use cargo or git.
        - cargo `cargo install paru`
        - `pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
        - Until I can install this using pacman I probably won't use it in the meantime i'll keep using yay (updated 2022-01-22)
- [Sticky](https://github.com/collinss/sticky)
    - A possible alternative to KNotes
- gui based graph plotting
    - [LabPlot2](https://labplot.kde.org/)
        - a gui for making plots (should make producing plots fairly quick when needed)
        - installed using flatpak `flatpak install flathub org.kde.labplot2`
    - [SciLab](http://www.scilab.org)
        - a gui for making plots (should make producing plots fairly quick when needed)
        - installed using flatpak `flatpak install flathub org.scilab.Scilab`
    - [AlphaPlot](https://alphaplot.sourceforge.io/)
        - installed using flatpak `flatpak install flathub io.github.narunlifescience.AlphaPlot`
- [Emulsion](https://github.com/lainsce/emulsion/)
    - a color (scheme) picking/creating application
    - installed using flatpak `flatpak install flathub io.github.lainsce.Emulsion`
- a browser for organizing web apps (e.g. email)
    - [Ferdi](https://getferdi.com/)
        - installed using flatpak `flatpak install flathub com.getferdi.Ferdi`
    - [Tangram](https://github.com/sonnyp/Tangram)
        - installed using flatpak `flatpak install flathub re.sonny.Tangram`
    - [WebCatalog](https://webcatalog.io/webcatalog/)
        - "Turn Any Websites into Real Desktop Apps" I plan to mostly use this for email and calendaring
        - installed via appimage
- Audio modification software
    - [EasyEffects](https://github.com/wwmm/easyeffects)
        - Audio effects for PipeWire applications
        - installed using flatpak `flatpak install flathub com.github.wwmm.easyeffects`
- [Xonsh](https://xon.sh/) a cross-platform shell that is written in and uses python
    - `yay -S xonsh`
    - [tutorial](https://xon.sh/tutorial.html) or use the command `xonfig tutorial`
    - `xonfig web` # Run the configuration tool in the browser to create ~/.xonshrc
    - [xensh cheatsheet](https://github.com/anki-code/xonsh-cheatsheet)
    - recommended ways to install
        - `python -m pip install 'xonsh[full]'`
        - `pip install pipx && pipx install --python python3.10 xonsh && pipx run xonsh`
    - xontribs to look at
        - [xonsh-autoxsh](https://github.com/Granitosaurus/xonsh-autoxsh)
        - [xontrib-kitty](https://github.com/scopatz/xontrib-kitty)
        - <https://github.com/anki-code/xontrib-prompt-starship>
        - <https://github.com/dyuri/xontrib-langenv>
        - <https://github.com/AstraLuma/xontrib-z>
        - <https://github.com/dyuri/xontrib-zoxide>
        - <https://github.com/anki-code/xontrib-argcomplete>
        - whole_word_jumping
