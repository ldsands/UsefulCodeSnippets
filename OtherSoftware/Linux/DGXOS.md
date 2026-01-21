# DGX OS

## General DGX OS Information and Resources

- "NVIDIA DGX OS provides a customized installation of Ubuntu Linux with system-specific optimizations and configurations, additional drivers, and diagnostic and monitoring tools." [From the "About DGX OS 7 / Ubuntu 24.04" page](https://docs.nvidia.com/dgx/dgx-os-7-user-guide/index.html)
- Due to the DGX Spark having an ARM 64 based SOC there are a lot of notes and instructions about how to deal with issues that have to do with running on ARM as opposed to amd64 or x86_64
- Useful Nvidia Docs links
    - [About DGX OS 7 / Ubuntu 24.04](https://docs.nvidia.com/dgx/dgx-os-7-user-guide/index.html)

## Installing DGX OS

TODO:

## Initial Setup Configuration Instructions

- Set up Git settings (so that there isn't any conflict with Windows)
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."

    ```sh
    # git should be preinstalled on DGX OS so you wont need to install it
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

## Installation Instructions

- [Ghostty](https://ghostty.org/) - my preferred terminal emulator
- [rofi](https://github.com/davatorium/rofi) is a launcher that allows for a lot of flexibility and allows me to also get to VSCode workspaces easily as well
    - TODO: finish set up and getting a keyboard shortcut to launch it as well

```sh
# install ghostty
sudo snap install ghostty
cd ~/.config/ghostty/ && wget ‐‐directory-prefix=~/.config/ghostty/config https://gist.githubusercontent.com/ldsands/1ac4cba04925688354099842ab95045b/raw/config -N
# install rofi (a launcher)
sudo apt install rofi
# set up using rofi
TODO:
```

- [rclone](https://rclone.org/) - Since pCloud doesn't have an arm64 version of their sync client I have to used something else
    - bisync
        - command options:
            - Gives progress (`--progress`) on what is syncing (e.g. how fast how many files an eta etc)
            - `--resync` is for the first sync (only modifies local files not remote files)
                - after the first sync you should remove the `--resync`
            - `--dry-run` no files are copied or deleted just lets you know what it'll do
            - Gives stats every 30 seconds during a sync `--stats 30s` (not sure but doesn't seem to work?)
        - [exclusions/filtering to make sure you're not uploading files that you don't want synced](https://rclone.org/bisync/#filtering):
            - use the `--filters-file` option
            - pCloud's exclusions including my own .venv addition: ".ds_store;.ds_store?;.appledouble;._*;.spotlight-v100;.documentrevisions-v100;.temporaryitems;.trashes;.fseventsd;.~lock.*;ehthumbs.db;thumbs.db;hiberfil.sys;pagefile.sys;$recycle.bin;*.part;.pcloud;.venv"
            - Note that if the filter file is ever changed then the md5 will change and to avoid suddenly having a lot of uploading/downloading conflicts

```sh
# install rclone
sudo apt install rclone
# can use snap but as of writing (2025-11-26) cannot mount using snap package
# copy my rcloneFliter.txt file from a gist ()
cd ~/; wget ‐‐directory-prefix=~/rcloneFilter.txt https://gist.githubusercontent.com/ldsands/6d9eaeca085b6dc67bfa17af9cc4f9c9/raw/5dfd6897eb0f52f0aceab573f7c00cd258e51cde/rcloneFilter.txt -N
# web GUI command with some options, probably easiest to connect to pCloud using the web GUI
rclone rcd --rc-web-gui --rc-addr :5572 --rc-user dgxuser --rc-pass YourSecurePassword123 --rc-web-gui-update
# to first sync use the --resync option then once complete do not use the resync option any more (resync doesn't delete anything)
rclone bisync "/home/ldsands/Documents/pCloudLocalLevi" "pCloud:/LeviStuff/pCloudLocalLevi" --resync --progress --filters-file /home/ldsands/rcloneFilter.txt
rclone bisync "/home/ldsands/Documents/pCloudLocalGithubRepos" "pCloud:/LeviStuff/pCloudLocalGithubRepos" --resync --progress --filters-file /home/ldsands/rcloneFilter.txt
rclone bisync "/home/ldsands/Documents/pCloudLeviTest" "pCloud:/LeviStuff/pCloudLeviTest" --resync --progress --filters-file /home/ldsands/rcloneFilter.txt
# usual command to use
rclone bisync "/home/ldsands/Documents/pCloudLocalLevi" "pCloud:/LeviStuff/pCloudLocalLevi" --progress --filters-file /home/ldsands/rcloneFilter.txt
rclone bisync "/home/ldsands/Documents/pCloudLocalGithubRepos" "pCloud:/LeviStuff/pCloudLocalGithubRepos" --progress --filters-file /home/ldsands/rcloneFilter.txt
rclone bisync "/home/ldsands/Documents/pCloudLeviTest" "pCloud:/LeviStuff/pCloudLeviTest" --progress --filters-file /home/ldsands/rcloneFilter.txt
# the usual commands written as aliases (and one custom command) for nushell
alias rclone_bisync_pcloud_local = rclone bisync "/home/ldsands/Documents/pCloudLocalLevi" "pCloud:/LeviStuff/pCloudLocalLevi" --progress --filters-file /home/ldsands/rcloneFilter.txt
alias rclone_bisync_pcloud_local_repos = rclone bisync "/home/ldsands/Documents/pCloudLocalGithubRepos" "pCloud:/LeviStuff/pCloudLocalGithubRepos" --progress --filters-file /home/ldsands/rcloneFilter.txt
def rclone_bisync_all_pcloud [] {
    print "starting rclone bisync of all pCloudLocal folders this usually takes about 1 minute"
    print "syncing pCloudLocalLevi"
    rclone bisync "/home/ldsands/Documents/pCloudLocalLevi" "pCloud:/LeviStuff/pCloudLocalLevi" --progress --filters-file /home/ldsands/rcloneFilter.txt
    print "syncing pCloudLocalGithubRepos"
    rclone bisync "/home/ldsands/Documents/pCloudLocalGithubRepos" "pCloud:/LeviStuff/pCloudLocalGithubRepos" --progress --filters-file /home/ldsands/rcloneFilter.txt
}
```

## Bugs and Other Temporary Configurations

- [Bluetooth audio is broken as of 2025-11-26](https://forums.developer.nvidia.com/t/pairing-headphones/348746) - supposedly a fix is incoming but until then the fix contained in one of the posts at the link here worked for me.

## Gnome Configurations

- Settings
    - Keyboard (Tab in Sidebar)
        - View and Customize Shortcuts
            - Name: Launch Files; Command: `nautilus /home/ldsands/Downloads`; Shortcut: `super+e`
            - Name: Launch Rofi; Command: `rofi -show drun`; Shortcut: `super+space`

## Gnome Extensions and Configurations

- Pre-installed extensions that I leave enabled
    - Desktop Icons NG (DING)
    - Removable Drive Menu
    - Ubuntu AppIndicators
    - UbuntuDock
    - User Themes
    - Workspace Indicator
- Extensions to Install
    - [Tiling Shell](https://github.com/domferr/tilingshell)
        - Appearance
            - Inner gaps = 5
            - Outer gaps = 5
            - Window Border
                - Enable = True
                - Width = 3
                - Border Color = I selected the middle blue color
        - Behavior
            - Enable tiling system = SUPER (from dropdown)
            - Span multiple tiles = ALT (from dropdown)
            - Enable Auto Tiling = True
            - Enable auto-resize of the complementing tiled windows = True
            - Restore window size = True
            - Add snap assistant and auto-tile buttons to window menu = True
            - Add tiled windows to ALT+TAB menu = True
