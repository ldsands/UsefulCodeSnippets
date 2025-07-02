# Fedora KDE

Fedora is a Linux distro that is very stable but has more frequent updates than many other distros that are also very stable.

- [Fedora KDE](#fedora-kde)
    - [Installing Fedora KDE](#installing-fedora-kde)
        - [Installing Nvidia Drivers](#installing-nvidia-drivers)
    - [Installing Programs](#installing-programs)
    - [Useful Fedora Notes to Be Aware Of](#useful-fedora-notes-to-be-aware-of)
    - [KDE Plasma Setup](#kde-plasma-setup)
    - [App Configurations](#app-configurations)
    - [Useful Commands to Use](#useful-commands-to-use)

## Installing Fedora KDE

I used Rufus on Windows to write the Fedora KDE `iso` file to a flash drive. I then just followed the instructions after booting into Fedora running on that flash drive.

### Installing Nvidia Drivers

- If you are running Fedora on a PC with an Nvidia GPU there may be some issues.
    - To install the correct drivers [Nvidia has some instructions prepared](https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/index.html#fedora)
        - Note that as of 2025-05-29 you must install the "cuda-drivers" (also known as the proprietary drivers as opposed to the `nvidia-open` drivers) to use cuda
            - `sudo dnf install cuda-drivers`
            - As of 2025-05-29 I had major issues as soon as I installed the drivers only one monitor worked and the screen will turn black every 30 seconds or so for a few seconds
    - Also to install and use cuda [Nvidia has some instructions prepared](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#fedora-installation).
    - You can switch between them
        - `dnf install --allowerasing nvidia-open` or `dnf install --allowerasing cuda-drivers`
- The above caused issues so instead I tried a simpler series of installations
    - [A summary of this method can be found at this Reddit post](https://www.reddit.com/r/Fedora/comments/1gg6bsg/comment/lunni37/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
        - `sudo dnf install akmod-nvidia`
            - make sure that this command gives output before you continue `modinfo -F version nvidia`
        - `sudo dnf install xorg-x11-drv-nvidia-cuda`
- The above also caused issues so I tried the instructions contained on this [GitHub Repo](https://github.com/roworu/nvidia-fedora-secureboot)
    - `sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs.x86_64 libva-nvidia-driver.x86_64 xorg-x11-drv-nvidia-cuda`

## Installing Programs

Install the following command line stuff and other configurations

- [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."

```sh
# install git
sudo dnf install git-all -y
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

- Install a terminal emulator
    - [Ghostty](https://ghostty.org/) My preferred terminal emulator as of 2025
    - [Kitty](https://sw.kovidgoyal.net/kitty/) my old preferred terminal emulator

```sh
# enable Ghostty from copr
dnf copr enable pgdev/ghostty
# Install Ghostty
dnf install ghostty
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

- Set def to download more items at once ([found in this video's description](https://www.youtube.com/watch?v=RrRpXs2pkzg))

```sh
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
```

- Install Enpass (my password manager). Look [here under the "For RPM package"](https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/)
    - Unfortunately, their instructions use yum just use dnf for install but otherwise it works as of 2025-05-29

    ```sh
    # Add Enpass yum repository
    cd /etc/yum.repos.d/
    sudo wget https://yum.enpass.io/enpass-yum.repo
    # After that, you can install Enpass as any other software package:
    sudo dnf install enpass
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

- Install Rust and rust related programs ([Go to this file for the details to install them all](/ProgrammingLanguages/Rust/Nushell.md))
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
    # install yazi via dnf copr rather than cargo
    dnf copr enable lihaohong/yazi
    dnf install yazi
    ```

- Install python related programs
    - Install [UV](https://docs.astral.sh/uv/) for managing both python and python projects

```sh
# install UV
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- Configure Discover (probably the easiest way to install, update, uninstall and manage applications)
    - Although Discover is the KDE application management application I put it here because some of the settings are distro specific
    - In the lower left there are several tabs, click on "Settings"
        - Under the "Flatpak" section make sure to enable "Flathub"

## Useful Fedora Notes to Be Aware Of

- Fedora uses dnf for packages management. Previously yum was a newer alternative however the improvements made to yum eventually were incorporated into dnf 5 which is the default for newer Fedora releases. [This Reddit post helps](https://www.reddit.com/r/Fedora/comments/12eoxg2/dnf_rpm_yum_its_just_too_much_and_confusing/)
- Note: A good gui for using dnf is called [dnfdragora](https://github.com/manatools/dnfdragora). You can install it using `dnf install dnfdragora-gui`. This can make installing some applications using dnf easier.
- There are multiple repositories that act kind of like AUR for Arch Linux
    - [Terra](https://terra.fyralabs.com/)
    - [Fedora COPR](https://copr.fedorainfracloud.org/coprs/)

## KDE Plasma Setup

[Go to the file specifically designed for setting up KDE](/OtherSoftware/Linux/KDEConfigurations.md)

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
            - In the "Context Menu" tab: (If you have Kitty installed)
                - Click on the button on the bottom of the window labeled "Download New Services..."
                - In the search box (in the upper right) search for "Kitty"
                - Select "Open Kitty Here" ([the GitHub repo for this service](https://github.com/raphtlw/open-kitty-here), [the KDE Store link](https://store.kde.org/p/1378539))
                - Click on the button (in the upper right) labeled "Install"
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

## Useful Commands to Use

- To upgrade the system (I assume upon major releases) [go to this link](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/#sect-performing-system-upgrade)

```sh
# To update your Fedora Linux release from the command-line do
sudo dnf upgrade --refresh

# non dnf updates
flatpak update; uv self update; rustup update; cargo install-update -a
```
