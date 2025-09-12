# EndeavourOS KDE Plasma

EndeavourOS is an arch Linux based distro that has become known for being fairly stable but has some more advanced features such as rolling releases which allow for cutting edge software.

- [EndeavourOS KDE Plasma](#endeavouros-kde-plasma)
    - [Installing EndeavourOS KDE Plasma](#installing-endeavouros-kde-plasma)
    - [Installing Programs](#installing-programs)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [App Configurations](#app-configurations)
    - [Other Important Notes](#other-important-notes)
    - [Useful Commands to Use Frequently](#useful-commands-to-use-frequently)
    - [Pacman and Yay Notes and Useful Commands](#pacman-and-yay-notes-and-useful-commands)

## Installing EndeavourOS KDE Plasma

- Use Rufus or some similar program to create a usb bootable drive with `.iso` files.
- During the installation you will need to choose

## Installing Programs

- Set up Git settings (so that there isn't any conflict with Windows)
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."

    ```sh
    # git should be preinstalled on EndeavourOS so you wont need to install it
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    git config --global credential.helper 'store --file ~/.my-credentials'
    # set up git to use your account (optional, make sure that you use the "{ID}+{username}@users.noreply.github.com" email format)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    # this makes it so you dont have to sign in every time you do anything with Github
    # if you still have issues you can look [here](https://stackoverflow.com/a/51097104) for some helpful tips
    # you will need to push (`git push`) a commit via terminal for this to work
    # you will need to enter your Github login and password (you must use a personal access token instead of your password)
    git config --global credential.helper 'store --file ~/.my-credentials'
    ```

- Install the following command line stuff and several programs that I regularly use
    - yay comes preinstalled so I use that for the majority of the installations
        - useful commands and notes on yay can be found in [this entry in another file in this repo](LinuxPrograms.md#arch-based-distros)
    - [Ghostty](https://ghostty.org/)
    - [Flatpak](https://www.flatpak.org/) [(and enable Flathub)](https://flathub.org/home)
    - [Enpass](https://www.enpass.io/) (my preferred password manager)
    - [pCloud](https://www.pcloud.com/) (my preferred cloud syncing platform/application)
        - install the AppImage file from their website
        - Make sure that you create an exemption to not sync anything in `.venv` directories
            - In the "Settings" tab, then the "Exclusions" tab, then in the textbox called "The following files will be excluded:" enter the following at the end
                - ".venv;"
    - Microsoft Edge (my preferred web browser)
    - [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions) (my preferred text editor and IDE)
        - I also install the [VSCode Projects Runner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it. You may have to reboot to have it start working after the installation.
            - As of at least 2023-10-27 using `yay -S krunner-vscodeprojects-git` does not work so follow the instructions below
                - For this you may need to build this manually. To do so you'll need to install some dependencies `yay -S cmake ecm-tools extra-cmake-modules`. You then might be able to uninstall those dependencies if they weren't installed anymore.
        - I sometimes also install the [VSCode Workspaces Runner for KRunner](https://github.com/Merrit/vscode-runner) plugin for KRunner which allows you to open VSCode workspaces directly from KRunner. Unlike VSCode Project Runner this KRunner plugin shows recent workspaces opened in VSCode. It also does not require a VSCode extension to work.
            - As of at least 2023-10-27 this aur entry (installed using `yay -S plasma-runner-vscode-git`) has been orphaned you'll need to figure out how to install it manually. There are instructions on the GitHub website.

    ```sh
    # install Ghostty
    yay -S ghostty
    # get my Ghostty config file from my gist
    cd ~/.config/ghostty/ && wget ‐‐directory-prefix=~/.config/ghostty/config https://gist.githubusercontent.com/ldsands/1ac4cba04925688354099842ab95045b/raw/config -N
    # install flatpak
    yay -S flatpak
    # enable installation from flathub (you'll need to restart to use this)
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # install enpass (my password manager of choice)
    yay -S enpass-bin
    yay -S microsoft-edge-stable-bin
    yay -S visual-studio-code-bin
    ```

- Install fonts (mostly for VSCode)

    ```sh
    yay -S ttf-ms-win11-auto # the Microsoft Windows 11 fonts
    yay -S ttf-aptos # the Microsoft 365 default font adopted in 2023
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode-2407.24.zip" https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip && unzip CascadiaCode-2407.24.zip && sudo fc-cache -f -v
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip && unzip CascadiaCode.zip && sudo fc-cache -f -v
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v
    ```

- Install Rust and rust related programs
    - The recommended way to use and install rust is by using rustup more can be found [here](https://www.rust-lang.org/tools/install)
    - The code below will also install several rust related programs
        - [Nushell](https://www.nushell.sh/) is a shell that is written in rust and cross-platform.
        - [Bottom](https://github.com/ClementTsang/bottom) - "[C]ross-platform graphical process/system monitor."
            - See below for a link to a gist that contains my preferred configuration options
            - use bottom by typing in `btm`
        - [Starship](https://starship.rs/) - "The minimal, blazing-fast, and infinitely customizable prompt for any shell!"
            - This requires a [Nerd Font](https://www.nerdfonts.com/) (or similar) to work properly here is a command that installs the Fira Code Nerd Font: `mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v`
            - See below for a link to a gist that contains my preferred configuration options
        - [Zoxide](https://github.com/ajeetdsouza/zoxide#installation) - "A smarter cd command."
            - This also uses (optionally) [fzf](https://github.com/junegunn/fzf) which is, "A command-line fuzzy finder"
        - [McFly](https://github.com/cantino/mcfly) - "McFly replaces your default `ctrl-r` shell history search with an intelligent search engine that takes into account your working directory and the context of recently executed commands."

    ```sh
    # install rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # you need to select 1 to install rust then restart your shell
    # update rust
    rustup update
    # install Nushell using cargo
    cargo install nu --locked
    # you will need to restart your shell
    # you can now start Nushell with this command
    nu
    # once you start Nushell for the first time you can just press `y` twice to create the default Nushell config and env files
    # installation of bottom which is a system resource manager (required rust)
    cargo install bottom
    # install zoxide
    cargo install zoxide --locked
    # install fzf which is an optional zoxide dependency
    yay -S fzf
    # install mcfly
    cargo install mcfly
    # this installs starship which is a cross platform/shell prompt
    curl -sS https://starship.rs/install.sh | sh
    # install yazi a file browser for the shell, note I have had issues so you may have to use yay instead
    cargo install --locked yazi-fm yazi-cli
    # enter bash for the following commands
    bash
    # create bottom and starship config files
    mkdir -p ~/.config && mkdir -p ~/.config/bottom/
    # copy my configuration from my gists to the bottom.toml, starship.toml and config.nu files
    cd ~/.config/bottom/ && wget ‐‐directory-prefix=~/.config/bottom/bottom.toml https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/bottom.toml -N
    cd ~/.config/ && wget ‐‐directory-prefix=~/.config/starship.toml https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/starship.toml -N
    # add a file so that kitty's default tab opens using Nushell
    '
    # point to a startup session file
    startup_session ~/.config/kitty/kitty-start.kitty
    ' | save -a ~/.config/kitty/kitty.conf
    '# launches default tab using `nu` command thus starting Nushell
    launch nu
    ' | save ~/.config/kitty/kitty-start.kitty
    ```

- Install python related programs
    - Install [UV](https://docs.astral.sh/uv/) for managing both python and python projects
    - I used to use pyenv and poetry to manage python and python projects respectively
        - Install pyenv using the [pyenv-installer repo](https://github.com/pyenv/pyenv-installer). You will also need to install dependencies to build python, more information about which dependencies to install can be found [here](https://github.com/pyenv/pyenv/wiki#troubleshooting--faq).
        - Install [Poetry](https://python-poetry.org/) to manage python project virtual environments.

```sh
# install UV
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- Install other command line applications I use
    - btop for resource motoring (works better than bottom for gpu information otherwise I prefer bottom)

```sh
# install btop
yay -S btop
# launch btop
btop
# you must then exit btop (use the `q` key)
# now use bash
bash
# append my preferred configurations to the bottom of the config file
cd ~/.config/btop/ && curl -sS https://gist.githubusercontent.com/ldsands/100eb8950fc7bccb94e2ba22b64d44c4/raw/btop.conf >> btop.conf
```

- Install flatpak applications

```sh
# update all flatpak applications
flatpak update
# show the applications that were explicitly installed (not including runtimes installed as dependencies)
flatpak list --app
# the list below is in alphabetical order
flatpak install flathub com.discordapp.Discord # Discord
flatpak install flathub com.github.tchx84.Flatseal # flatseal for managing flatpak permissions
flatpak install flathub com.spotify.Client # Spotify for music
flatpak install flathub com.usebottles.bottles # bottles (for Windows applications)
flatpak install flathub io.github.flattool.Warehouse # Warehouse for flakpak program management
flatpak install flathub io.github.peazip.PeaZip # for extraction and compression
flatpak install flathub io.missioncenter.MissionCenter # Monitor system resource usage
flatpak install flathub it.mijorus.gearlever # Gear Lever for management of AppImage applications (create desktop files etc.)
flatpak install flathub org.kde.kfind # KFind for searching files
flatpak install flathub org.kde.okular # lightweight pdf viewer NOTE: should remove the pacman version first `yay -R okular`
flatpak install flathub org.kde.gwenview # great image viewer NOTE: should remove the pacman version first `yay -R gwenview`
flatpak install flathub org.libreoffice.LibreOffice # MS Office replacement
flatpak install flathub org.onlyoffice.desktopeditors # OnlyOffice sometimes better for docx and pptx files
flatpak install flathub org.telegram.desktop # Telegram Desktop
flatpak install flathub org.zotero.Zotero # Zotero
# Below are those that I generally prefer to install via yay
flatpak install flathub io.enpass.Enpass # for passwords NOTE: using flatpak it will not work with browsers
flatpak install flathub com.obsproject.Studio # OBS Studio for virtual meetings/streaming/recording, note you must install v4l2loopback via `yay -S v4l2loopback` to use the virtual camera feature
flatpak install flathub com.obsproject.Studio.Plugin.BackgroundRemoval # Background Removal for OBS
flatpak install flathub com.microsoft.EdgeDev # web browser
flatpak install flathub com.google.Chrome # web browser
```

- There are a couple of URLs on AUR where you can find other KDE applications that are not listed in the normal AUR database (they're listed under the Extra repository)
    - [Group Details - plasma (x86_64)](https://archlinux.org/groups/x86_64/plasma/) - core KDE Plasma packages
    - [Group Details - kde-applications (x86_64)](https://archlinux.org/groups/x86_64/kde-applications/) - KDE applications

- Bluetooth may have issues and need to be enabled with this command: `sudo systemctl enable bluetooth` ([I found out about this here](https://discovery.endeavouros.com/audio/bluetooth/2021/03/)).

## KDE Plasma Setup

[Go to the file specifically designed for setting up KDE](/OtherSoftware/Linux/KDEConfigurations.md)

## App Configurations

- Dolphin
    - I hide the following directories from the "Places" panel: `Music`, `Pictures` and `Videos`
    - I add these directories to the "Places" panel: `pCloudDrive`, `pCloudLocalLevi`, `ComputerStuff`, `ResearchProjects` and `Uiowa`. I also add any current project and class directories for easy access.
    - Click on the hamburger menu near the upper right hand corner and mouse over "Configure"
        - Click on "Configure Toolbars"
            - I search for "Up" in "Available actions" and add it to "Current Actions" and then move it to the top.
        - Click on "Configure Dolphin"
            - In the "Interface" tab:
                - In the "Folders & Tabs" tab:
                    - Change the default startup location to `/home/$USER/Downloads` (you will need to replace $USER with your username)
            - In the "View" tab:
                - In the "General" tab:
                    - Under "Miscellaneous:" Deselect "Show selection marker"
            - In the "Context Menu" tab:
                - If you have Kitty installed
                    - Click on the button on the bottom of the window labeled "Download New Services..."
                    - In the search box (in the upper right) search for "Kitty"
                    - Select "Open Kitty Here" ([the GitHub repo for this service](https://github.com/raphtlw/open-kitty-here), [the KDE Store link](https://store.kde.org/p/1378539))
                    - Click on the button (in the upper right) labeled "Install"
                - Deselect "Run In Konsole"
                - To add The option to open a folder in VSCode
                    - At the bottom click on the button "Download New Services..."
                    - Search for "VSCode" (in the upper right)
                    - Click the "Install" button that show up when you mouse over "Open in VSCode / VS Code"
                        - Note there is another called "Open In VSCode" it is not updated or used as much as the other
- Gwenview (an Image Viewer)
    - Click on the hamburger menu near the upper right hand corner and mouse over "Configure"
        - Click on "Configure Keyboard Shortcuts"
            - Next to "Open Containing Folder" select "Custom" enter the Keyboard shortcut of `ctrl+e, ctrl+e`
            - Under "File" next to "Quit" click under "Alternate" next to "Custom:" select the button then enter `ctrl+w`; select "OK" at the bottom of the dialogue box
- Okular (a document viewer)
    - [Note that there is a bug](https://bugs.kde.org/show_bug.cgi?id=443404) that can impact scrolling using a scroll wheel when not in continuous mode
    - In the menu bar click on "Settings"
        - Click on "Configure Keyboard Shortcuts..."
            - Next to "Open Containing Folder" select "Custom" enter the Keyboard shortcut of `ctrl+e, ctrl+e`
            - Under "File" next to "Quit" click under "Alternate" next to "Custom:" select the button then enter `ctrl+w`; select "OK" at the bottom of the dialogue box (a pop up will ask if you want to reassign click on "Reassign")
        - Click on "Configure Okular..."
            - In the "General" tab
                - Uncheck "Open in continuous mode by default"
                - Next to "Default zoom:" select "Fit Page"
- LibreOffice
    - From "View" select "User Interface"
        - Select "Tabbed"
    - There is an issue with fonts in some flatpak applications (I think only GTK based applications) being very blocky (the antialiasing doesn't work right)
        - [some details can be found here](https://github.com/flatpak/flatpak/issues/2861)
        - To fix this for Arch Distros you must install a gtk package. Use this command `yay -S xdg-desktop-portal-gtk`
        - Another fix for this is to use Flatseal select LibreOffice then deselect "Wayland windowing system" (sub-label is "socket=wayland")

## Other Important Notes

- The Baloo file extractor will cache all files for searches however that is not a good idea for pCloud or Zotero local storage. More information can be found [here](https://community.kde.org/Baloo/Configuration#Exclude_Folders). If you want to see what is being indexed you can use the command `balooctl6 monitor`. You can get some basic status using the `balooctl6 status` command. The command `balooctl6 purge` will delete the indexed files and restart indexing. To disable baloo use `balooctl6 disable`. To see more command options use the `balooctl6` command. To stop this use the command below:

    ```sh
    echo 'exclude folders[$e]=$HOME/pCloudDrive/,$HOME/Zotero/,$HOME/yay/,$HOME/,$HOME/.*,$HOME/*.*,$HOME/*.**
    ' >> ~/.config/baloofilerc
    ```

- I usually dual boot Windows and Linux. The default for bootctl (systemd) to select an OS to boot is 5 seconds.
    - To increase the systemd timeout to select an OS to boot into you can use the command `bootctl set-timeout ""` in linux (this example sets the timeout to 10 seconds).
    - You can also press `shift+t` then hit `+` or `-` to increase or decease the time until boot automatically happens

## Useful Commands to Use Frequently

- To update most everything I have installed:

```sh
flatpak update; flatpak uninstall --unused; rustup update; cargo install-update -a --locked; uv self update
# with snap
flatpak update; flatpak uninstall --unused; rustup update; cargo install-update -a; uv self update; snap refresh --list
# if there is a snap package to update you must use sudo (see command below)
snap refresh
# to update arch based packages (you will need to use your password if there is something to update)
yay
```

## Pacman and Yay Notes and Useful Commands

- When there are issues after an update there are several things that might help
    - It can be useful to see the kernel initialization messages (especially since I can't seem to scroll when that output gets stuck)
        - `sudo dmesg` to search for something without case-sensitivity `sudo dmesg | grep -i error`
    - When there is an issue it might be useful to see the last upgraded packages the command below show the latest 20 packages updated
        - `expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20` (note this won't work on Nushell use Bash instead)
    - You can use the "downgrade" package (allows you to use cache or internet to specify a package to downgrade)
        - If it isn't already installed `yay -S downgrade`
        - example use `sudo downgrade ignore=never ostree --prefer-cache`
    - One issue that has been somewhat common in late August 2025 (due to some attacks on Arch Linux infrastructure) was issues installing packages with yay (pacman)
        - When you cannot see Linux in the systemd boot menu you can use an ISO to help fix it
            - Boot into an EndeavourOS ISO then use the commands below to fix your arch distro

```sh
# some useful sites to help
# https://discovery.endeavouros.com/system-rescue/arch-chroot/2022/12/
# https://www.reddit.com/r/EndeavourOS/comments/180iqqw/how_do_i_chroot_into_eos_from_usb/
# to get a list of partitions
sudo fdisk -l
# from the output look for the "Linux filesystem" that has your broken distro main partition in this example nvme1n1p2
sudo mount /dev/nvme1n1p2 /mnt
# then you need to mount the "EFI System" partition that is broken on the same drive as the broken distro above
sudo mount /dev/nvme1n1p1 /mnt/efi
# to get into the admin profile of the mounted linux distro
sudo arch-chroot /mnt
# Get the last 20 arch packages installed
expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20
# use downgrade to downgrade the packages that caused issues
sudo downgrade linux linux-headers systemd systemd-libs eos-bash-shared systemd-resolvconf systemd-sysvcompat --prefer-cache
```
