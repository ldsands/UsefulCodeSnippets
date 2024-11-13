# EndeavourOS KDE Plasma

EndeavourOS is an arch Linux based distro that has become known for being fairly stable but has some more advanced features such as rolling releases which allow for cutting edge software.

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
    - [Kitty](https://sw.kovidgoyal.net/kitty/) (my preferred terminal emulator)
    - [Pamac](https://wiki.manjaro.org/index.php?title=Pamac) - "Pamac (Add/Remove Software) is Manjaro's Package Manager. It is based on libalpm with AUR and Appstream support." - I like this for a gui to install applications
    - [Flatpak](https://www.flatpak.org/) [(and enable Flathub)](https://flathub.org/home)
    - [Enpass](https://www.enpass.io/) (my preferred password manager)
    - [pCloud](https://www.pcloud.com/) (my preferred cloud syncing platform/application)
        - install the AppImage file from their website
    - [Microsoft Edge (Beta)](https://www.microsoftedgeinsider.com/en-us/download/beta) (my preferred web browser)
    - [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions) (my preferred text editor and IDE)
        - I also install the [VSCode Projects Runner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it. You may have to reboot to have it start working after the installation.
            - As of at least 2023-10-27 using `yay -S krunner-vscodeprojects-git` does not work so follow the instructions below
                - For this you may need to build this manually. To do so you'll need to install some dependencies `yay -S cmake ecm-tools extra-cmake-modules`. You then might be able to uninstall those dependencies if they weren't installed anymore.
        - I sometimes also install the [VSCode Workspaces Runner for KRunner](https://github.com/Merrit/vscode-runner) plugin for KRunner which allows you to open VSCode workspaces directly from KRunner. Unlike VSCode Project Runner this KRunner plugin shows recent workspaces opened in VSCode. It also does not require a VSCode extension to work.
            - As of at least 2023-10-27 this aur entry (installed using `yay -S plasma-runner-vscode-git`) has been orphaned you'll need to figure out how to install it manually. There are instructions on the GitHub website.

    ```sh
    yay -S kitty kitty-shell-integration kitty-terminfo
    # to add settings to the `~/.config/kitty/kitty.conf` file
    echo "
    # located here `~/.config/kitty/kitty.conf`
    map ctrl+c copy_or_interrupt
    map ctrl+v paste_from_clipboard
    map ctrl+t new_tab
    map ctrl+w close_window
    map ctrl+tab next_tab
    map ctrl+shift+tab previous_tab
    background_opacity 0.6
    :     font_family      FiraCode Nerd Font Mono
    # :     font_family      CaskaydiaCove Nerd Font
    # :     font_family      Cascadia Code NF
    startup_session ~/.config/kitty/kitty-start.kitty
    # create a kitty-start.kitty file here: `$HOME/.config/kitty/` you can use the command: `touch /$HOME/.config/kitty/`
    # to start a shell as the default add one of the lines below with out the "# " characters
    # launch nu
    # launch xonsh
    # launch bash
    # launch zsh
    " >> ~/.config/kitty/kitty.conf
    # install pamac
    yay -S pamac-all
    # install flatpak
    yay -S flatpak
    # enable installation from flathub (you'll need to restart to use this)
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # install enpass (my password manager of choice)
    yay -S enpass-bin
    yay -S microsoft-edge-beta-bin
    yay -S visual-studio-code-bin
    ```

- Install fonts (mostly for VSCode)

    ```sh
    yay -S zip
    # the CascadiaCode-2404.23.zip needs to be tested to see if it works
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode-2404.23.zip" https://github.com/microsoft/cascadia-code/releases/download/v2404.23/CascadiaCode-2404.23.zip && unzip CascadiaCode-2404.23.zip && sudo fc-cache -f -v
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip && unzip CascadiaCode.zip && sudo fc-cache -f -v
    mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v
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
    # nushell dependencies for Fedora
    sudo dnf install libxcb openssl-devel libX11-devel -y
    # install Nushell using cargo
    cargo install nu --features=dataframe
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
# install pyenv
curl https://pyenv.run | bash
# you may need to add these lines to ~/.bashrc (this uses Nushell)
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
# install Poetry
curl -sSL https://install.python-poetry.org | python3 -
# add Poetry to PATH
echo '
# poetry path
export PATH="$HOME/.local/bin:$PATH"\n' >> ~/.bashrc
```

- Install flatpak applications

```sh
# update all flatpak applications
flatpak update
# show the applications that were explicitly installed (not including runtimes installed as dependencies)
flatpak list --app
# the list below is in alphabetical order
flatpak install flathub com.discordapp.Discord # Discord
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux # Microsoft Teams
flatpak install flathub com.github.tchx84.Flatseal # flatseal for managing flatpak permissions
flatpak install flathub com.google.Chrome # web browser
flatpak install flathub com.microsoft.EdgeDev # web browser
flatpak install flathub com.obsproject.Studio # OBS Studio for virtual meetings/streaming/recording, note you must install v4l2loopback via `yay -S v4l2loopback` to use the virtual camera feature
flatpak install flathub com.obsproject.Studio.Plugin.BackgroundRemoval # Background Removal for OBS
flatpak install flathub com.spotify.Client # Spotify for music
flatpak install flathub com.usebottles.bottles # bottles (for Windows applications)
flatpak install flathub io.enpass.Enpass # for passwords NOTE: it will not work with browsers
flatpak install flathub io.github.flattool.Warehouse # Warehouse for flakpak program management
flatpak install flathub io.github.peazip.PeaZip # for extraction and compression
flatpak install flathub io.github.shiftey.Desktop # github desktop
flatpak install flathub io.missioncenter.MissionCenter # Monitor system resource usage
flatpak install flathub org.kde.okular # lightweight pdf viewer NOTE: should remove the pacman version first
flatpak install flathub org.libreoffice.LibreOffice # MS Office replacement
flatpak install flathub org.onlyoffice.desktopeditors # OnlyOffice better for docx and pptx files
flatpak install flathub org.telegram.desktop # Telegram Desktop
flatpak install flathub org.zotero.Zotero # Zotero
```

- There are a couple of URLs on AUR where you can find other KDE applications that are not listed in the normal AUR database (they're listed under the Extra repository)
    - [Group Details - plasma (x86_64)](https://archlinux.org/groups/x86_64/plasma/) - core KDE Plasma packages
    - [Group Details - kde-applications (x86_64)](https://archlinux.org/groups/x86_64/kde-applications/) - KDE applications

- NixOS is a package manager (and they have their own distro) that is distro agnostic and has a lot of advantages over other package managers.

```sh
# install NixOS package manager (this will install it for multi-users which is recommended)
sh <(curl -L https://nixos.org/nix/install) --daemon
# To install packages that contain non-free software you'll need to add the line below to this file: ~/.config/nixpkgs/config.nix
{ allowUnfree = true; }
# to allow KDE to see the .desktop files you'll need to use the command below:
cp -L ~/.nix-profile/share/applications/* ~/.local/share/applications/
```

TODO: add this later from LinuxPrograms.md

- Bluetooth may have issues and need to be enabled with this command: `sudo systemctl enable bluetooth` ([I found out about this here](https://discovery.endeavouros.com/audio/bluetooth/2021/03/)).

## KDE Plasma Setup

System Settings to change. Open "System Settings" then you can search or find the categories listed (in the left sidebar) below to edit settings. I try to follow the order they appear in the System Settings Application.

- "Appearance"
    - "Global Theme"
        - Select "Breeze Dark"
- Under the "Workspace" category
    - "Workspace Behavior"
        - "General Behavior"
            - Clicking files or folders; change to "Selects them"
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
                - The lower left select "Grid"
        - "Screen Locking"
            - Lock screen automatically: uncheck
        - "Virtual Desktops"
            - "Workspace Behavior"; "Virtual Desktops"
                - I create 12 Virtual Desktops with three desktops in each of 4 rows
                - Row 1: `Random 01`, `Random 02` and `Random 03`
                - Row 2: `School 01`, `School 02` and `School 03`
                - Row 3: `Python 01`, `Python 02` and `Python 03`
                - Row 4: `Email`, `CommsMusic` and `Todo`
            - Enable "Navigation wraps around"
            - Enable "Show on-screen display when switching" and change the value toaa 500 ms
            - Enable "Show desktop layout indicators"
    - "Window Management"
        - "Task Switcher"
            - In the "Visualization" column select "Thumbnail Grid" from the dropdown menu
            - Do this for both the "Main" and the "Alternate" tabs (at the top of the sub-window that contains the settings above)
            - Click on the "Apply" button in the lower right corner
    - "Shortcuts" (these are in alphabetical order since scrolling through them isn't as useful as searching for each individually)
        - "KRunner": `meta+space`
        - "Maximize Window": `meta+home`
        - "Show Desktop Grid": `meta+tab`
        - "Spectacle"; "Capture Rectangular Region": `meta+shift+s`
        - "Switch One Desktop Down": `meta+ctrl+down`
        - "Switch One Desktop Up": `meta+ctrl+up`
        - "Switch One Desktop to the Left": `meta+ctrl+left`
        - "Switch One Desktop to the Right": `meta+ctrl+right`
        - Click the button "Add Application" select Kitty; Click "Add custom shortcut" `meta+shift+t`
    - "Search"; "Plasma Search": (to modify results that appear in KRunner)
        - Click on "Configure KRunner..."
            - Next to "History:" select "Enabled auto-complete"
        - Deselect "Browser History"
        - Deselect "Browser Tabs"
        - Deselect "Kate Sessions"
        - Deselect "Konsole Profiles"
        - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
            - This may not work so instead go tho the projects GitHub pages and follow the instructions found there
        - Click on "Get New Plugins"; search for "VSCode Workspaces Runner" then install that plugin
            - This may not work so instead go tho the projects GitHub pages and follow the instructions found there
- Under the "Personalization" category
    - "Notifications"
        - Next to "Low priority notifications" enable "Show in history"
    - "Applications"; "Default Applications";
        - "Web Browser": select "Microsoft Edge (beta)"
        - "Terminal emulator": select "Kitty"
- Next to the search box in the upper left click on the hamburger menu
    - Select "Highlight Changed Settings" button to easily see which settings have been changed from their defaults

Next there are several changes I make to the panel(s) (taskbar(s)) and the desktop.

- Panel (in Windows Terminology the taskbar)
    - Right click on the battery icon and select "Show Battery Percentage on Icon" (on computers with a battery like a laptop)
    - Right click on the clock and select "Configure Digital Clock ..." Then next to "Date format:" select "ISO Date"
    - Right click on the panel (called taskbar on Windows) and select "Edit Panel..."
        - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"
        - Select the "Behavior" tab in the sidebar;
            - For "Groups" select "Do not group"
            - For "Show Only Tasks" select "From current screen" (make sure both "From current desktop" and "From current activity" are also selected)
    - Right Click on the down arrow in the system tray and click on "Configure System Tray..."
        - "General" Tab
            - From the "Panel icon spacing:" drop down box select "Small"
        - "Keyboard Shortcuts" Tab
            - Click on the button that says "None" and enter the keyboard shortcut `meta+a`
        - "Entries" Tab
            - Search for "notifications"
                - next to "Notifications" in the column "Keyboard Shortcut" click on the button then enter the keyboard shortcut `meta+n`
    - Right Click on the panel and click "Add Widgets..."
        - Find and drag the "Window List" Widget to the panel next to the System Tray
    - If there are two monitors
        - Do the following for whichever monitor that is not the "Primary" monitor (as indicated in the "Display Configuration" in the System Settings application)
            - Right click on a blank spot of the desktop, mouse over "Add Panel" then click on "Default Panel"
            - Repeat the above panel settings for the new panel
            - Remove the system tray from one monitor (I usually choose the non primary monitor to keep the system tray)
            - Remove the "Window List" Widget from one monitor (I usually choose the non-primary monitor to keep this widget)
- Desktop
    - Right click on a blank section of the desktop and select "Enter Edit Mode"
        - Select the "Add Widgets..." (assuming there are two monitors, if not I put the locations used below will all work with each other on one monitor)
            - On the right screen in the upper left hand corner I add the widget "Pager" onto the Desktop
                - I make it big enough to see all nine desktops well
                - Right click on the widget and select "Configure Pager"
                    - In the "General" tab I select "Show applications icons on window outlines"
                    - Also in the "General" tab I select "Text Display"; "Desktop Name"
            - On the right screen in the upper right corner I add the "Weather Report" widget
            - On the left screen in the lower left I add the "Window List" widget

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
            - In the "Context Menu" tab: (If you have Kitty installed)
                - Click on the button on the bottom of the window labeled "Download New Services..."
                - In the search box (in the upper right) search for "Kitty"
                - Select "Open Kitty Here" ([the GitHub repo for this service](https://github.com/raphtlw/open-kitty-here), [the KDE Store link](https://store.kde.org/p/1378539))
                - Click on the button (in the upper right) labeled "Install"
                - Deselect "Run In Konsole"
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
