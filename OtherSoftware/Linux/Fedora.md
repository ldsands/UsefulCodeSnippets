# Fedora KDE

Fedora is a Linux distro that is very stable but has more frequent updates than many other distros that are also very stable.

- [Fedora KDE](#fedora-kde)
    - [Installing Fedora KDE](#installing-fedora-kde)
        - [Installing Nvidia Drivers](#installing-nvidia-drivers)
    - [Installing Programs](#installing-programs)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [App Configurations](#app-configurations)

## Installing Fedora KDE

I used Rufus on Windows to write the Fedora KDE `iso` file to a flash drive. I then just followed the instructions after booting into Fedora running on that flash drive.

### Installing Nvidia Drivers

If you are running Fedora on a PC with an Nvidia GPU Video will be really bad until the Nvidia drivers are installed. Good instructions can be found [here](https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-fedora-36-linux/).

## Installing Programs

- Install the following command line stuff and other configurations
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
    - [Kitty](https://sw.kovidgoyal.net/kitty/) (my preferred terminal emulator)
    - Set def to download more items at once ([found in this video's description](https://www.youtube.com/watch?v=RrRpXs2pkzg))

    ```sh
    # install git
    sudo dnf install git-all -y
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    # set dnf download settings to download 10 items at once
    fastestmirror=True
    max_parallel_downloads=10
    defaultyes=True
    keepcache=True
    # clear dnf cache
    sudo dnf clean all
    # enable RPM Fusion
    sudo dnf groupupdate core
    # change Hostname
    sudo hostnamectl set-hostname "ldsands_host"
    # install media codecs
    sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
    sudo dnf groupupdate sound-and-video
    # Install Kitty
    dnf install kitty -y
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
    ```

- Install Enpass (my password manager). Look [here under the "For RPM package"](https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/)

    ```sh
    # Add Enpass yum repository
    cd /etc/yum.repos.d/
    sudo wget https://yum.enpass.io/enpass-yum.repo
    # After that, you can install Enpass as any other software package:
    sudo yum install enpass
    ```

- [Install Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions)
    - I also install the [VSCode Projects Runner for KRunner](https://github.com/alex1701c/krunner-vscodeprojects) plugin for KRunner which allows you to open VSCode projects directly from KRunner. You also need to set up the [Project Manager](https://github.com/alefragnani/vscode-project-manager) extension to use it. You may have to reboot to have it start working after the installation.
    - I also install the [VSCode Workspaces Runner for KRunner](https://github.com/Merrit/vscode-runner) plugin for KRunner which allows you to open VSCode workspaces directly from KRunner. Unlike VSCode Project Runner this KRunner plugin shows recent workspaces opened in VSCode. It also does not require a VSCode extension to work.

    ```sh
    # We currently ship the stable 64-bit VS Code in a yum repository, the following script will install the key and repository:
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=<https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc>" > /etc/yum.repos.d/vscode.repo'
    # Then update the package cache and install the package using dnf (Fedora 22 and above):
    dnf check-update
    sudo dnf install code
    # to install both of the VSCode Runners for KRunner you need to install cmake and other dependencies
    sudo dnf install cmake extra-cmake-modules kf5-ki18n-devel kf5-kservice-devel kf5-krunner-devel kf5-ktextwidgets-devel kf5-kconfigwidgets-devel qt5-qtdeclarative-devel gettext -y
    # Verify the version installation using the following command:
    cmake --version
    # then to install VSCode Project Runner using their script
    curl https://raw.githubusercontent.com/alex1701c/krunner-vscodeprojects/master/install.sh | bash
    # then restart KRunner (this won't work when using Wayland)
    kquitapp5 krunner;kstart5 krunner
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
    sudo dnf install fzf -y
    # install mcfly
    cargo install mcfly
    # this installs starship which is a cross platform/shell prompt
    cargo install starship --locked
    # create bottom and starship config files
    mkdir -p ~/.config && mkdir -p ~/.config/bottom/
    # enter bash for the following commands
    bash
    # copy my configuration from my gists to the bottom.toml, starship.toml and config.nu files
    cd ~/.config/bottom/ && wget ‐‐directory-prefix=~/.config/bottom/bottom.toml https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/bottom.toml -N
    cd ~/.config/ && wget ‐‐directory-prefix=~/.config/starship.toml https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/starship.toml -N
    cd ~/.config/nushell/ && wget ‐‐directory-prefix=~/.config/nushell/config.nu https://gist.githubusercontent.com/ldsands/d3eac90b0b9d2b8613e165cc9e49d4f3/raw/config.nu -N
    ```

- Install python related programs
    - Install pyenv using the [pyenv-installer repo](https://github.com/pyenv/pyenv-installer). You will also need to install dependencies to build python, more information about which dependencies to install can be found [here](https://github.com/pyenv/pyenv/wiki#troubleshooting--faq).
    - Install [Poetry](https://python-poetry.org/) to manage python project virtual environments.

    ```sh
    # install python/pyenv build dependencies
    sudo dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel -y
    # install pyenv
    curl https://pyenv.run | bash
    # you may need to add these lines to ~/.bashrc (this uses Nushell)
    '
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
    ' | save -a ~/.bashrc
    # install Poetry
    curl -sSL https://install.python-poetry.org | python3 -
    ```

- Configure Discover (probably the easiest way to install, update, uninstall and manage applications)
    - Although Discover is the KDE application management application I put it here because some of the settings are distro specific
    - In the lower left there are several tabs, click on "Settings"
        - Under the "Flatpak" section make sure to enable "Flathub"

## KDE Plasma Setup

System Settings to change. Open "System Settings" then you can search or find the categories listed (in the left sidebar) below to edit settings. I try to follow the order they appear in the System Settings Application.

- "Appearance"
    - "Global Theme"
        - Select "Breeze Dark"
- Under the "Workspace" category
    - "Workspace Behavior"
        - "Desktop Effects"
            - Search for "Desktop Grid"
                - Select the "Configure..." button
                - Set "Border width:" to 5
                - For "Desktop name alignment:" select "Top"
                - Deselect "Show buttons to alter count of virtual desktops"
                - Click on the "OK" button
        - "General Behavior"
            - Clicking files or folders; change to "Selects them"
        - "Screen Edges"
            - For all corners select "No Action" except:
                - The upper right corner select "Present Windows - Current Desktops"
                - The lower right corner select "Present Windows - All Desktops"
                - The lower left select "Desktop Grid"
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
    - "Window Behavior"
        - "Task Switcher"
            - In the "Visualization" column select "Thumbnail Grid" from the dropdown menu
            - Do this for both the "Main" and the "Alternate" tabs (at the top of the sub-window that contains the settings above)
    - "Shortcuts" (these are in alphabetical order since scrolling through them isn't as useful as searching for each individually)
        - "Activate Notifications Widget": `meta+a`
        - "KRunner": `meta+space`
        - "Maximize Window": `meta+home`
        - "Show Desktop Grid": `meta+tab`
        - "Spectacle"; "Capture Rectangular Region": `meta+shift+s`
        - "Switch One Desktop Down": `meta+ctrl+down`
        - "Switch One Desktop Up": `meta+ctrl+up`
        - "Switch One Desktop to the Left": `meta+ctrl+left`
        - "Switch One Desktop to the Right": `meta+ctrl+right`
        - Click the button "Add Application" select Kitty; Click "Add custom shortcut" `meta+t`
    - "Startup and Shutdown"
        - "Background Services"
            - Make sure that "Removable Device Automounter" is not checked
    - "Search"; "Plasma Search": (to modify results that appear in KRunner)
        - Deselect "Browser History"
        - Deselect "Browser Tabs"
        - Deselect "Kate Sessions"
        - Deselect "Konsole Profiles"
        - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
        - Click on "Get New Plugins"; search for "VSCode Workspaces Runner" then install that plugin
- Under the "Personalization" category
    - "Notifications"
        - Next to "Low priority notifications" enable "Show in history"
    - "Applications"; "Default Applications";
        - "Web Browser": select "Microsoft Edge (beta)"
        - "Terminal emulator": select "Kitty"
- Under the "Hardware" category
    - Removable Storage; Removable Devices
        - Check "Enable automatic mounting of removable media" and "Only automatically mount removable media that has been manually mounted before"
- Select "Highlight Changed Settings" button at the bottom of the side bar to easily see which settings have been changed from their defaults

Next there are several changes I make to the panel(s) (taskbar(s)) and the desktop.

- Panel (in Windows Terminology the taskbar)
    - Right click on the battery icon and select "Show Battery Percentage on Icon" (on computers with a battery like a laptop)
    - Right click on the clock and select "Configure Digital Clock ..." Then next to "Date format:" select "ISO Date"
    - Right click on the panel (called taskbar on Windows) and select "Edit Panel..."
        - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"
        - Select the "Behavior" tab in the sidebar;
            - For "Groups" select "Do not group"
            - For "Show Only Tasks" select "From Current Screen"
    - Right Click on the down arrow in the system tray and click on "Configure System Tray..."
        - "General"
            - From the "Panel icon spacing:" drop down box select "Small"
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

- Microsoft Edge (Beta)
    - Sign in using Microsoft Account
    - Create PWAs from my Outlook Accounts (and others):
        - Open the "Application Launcher" (like the start button from Windows); search for "Outlook (PWA)"; right click on the result; Select "Application" tab;
        - Select the ellipsis menu in the upper right; select permissions; next to "Notifications" Select "Allow"
        - I do this for my two Outlook Accounts (Personal Outlook, Uiowa Outlook) and [MonkeyType](https://monkeytype.com/) which I use to keep my typing speed up.
- Dolphin
    - I hide the following directories from the "Places" panel: `Music`, `Pictures` and `Videos`
    - I add these directories to the "Places" panel: `pCloudDrive`, `pCloudLocalLevi`, `ComputerStuff`, `ResearchProjects` and `Uiowa`. I also add any current project and class directories for easy access.
    - Click on the hamburger menu near the upper right hand corner and mouse over "Configure"
        - Click on "Configure Toolbars"
            - I search for "Up" in "Available actions" and add it to "Current Actions" and then move it to the top.
        - Click on "Configure Dolphin"
            - In the "Startup" tab:
                - Change the default startup location to `/home/$USER/Downloads` (you will need to replace $USER with your username)
                - Unselect the "Open new folders in tabs" this is because it doesn't work well with multiple virtual desktops (however using `ctrl+t` will still open a new tab in the currently opened window)
- Gwenview (an Image Viewer)
    - Click on the hamburger menu near the upper right hand corner and mouse over "Configure"
        - Click on "Configure Keyboard Shortcuts"
            - Next to "Open Containing Folder" select "Custom" enter the Keyboard shortcut of `ctrl+e, ctrl+e`
            - Under "File" next to "Quit" click under "Alternate" next to "Custom:" select the button then enter `ctrl+w`; select "OK" at the bottom of the dialogue box
- Okular (a document viewer)
    - In the menu bar click on "Settings"
        - Click on "Configure Keyboard Shortcuts..."
            - Next to "Open Containing Folder" select "Custom" enter the Keyboard shortcut of `ctrl+e, ctrl+e`
            - Under "File" next to "Quit" click under "Alternate" next to "Custom:" select the button then enter `ctrl+w`; select "OK" at the bottom of the dialogue box (a pop up will ask if you want to reassign clik on "Reassign")
        - Click on "Configure Okular..."
            - In the "General" tab
                - Uncheck "Open in continuous mode by default"
                - Next to "Default zoom:" select "Fit Page"
- LibreOffice
    - It seems like when LibreOffice is in dark mode it doesn't automatically change the icons so they are very difficult to see. To change this select "Tools" then "Options" then under "LibreOffice" select "View"
        - Under "Icon style:" select "Breeze (SVG + dark)" then click the "Apply" button.
    - I also prefer the "ribben" style of user interface. To change to the ribbon ui go to "View" then "User Interface..." Then select "Tabbed"
