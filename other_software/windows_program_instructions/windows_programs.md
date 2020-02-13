# Windows programs

- [Windows programs](#windows-programs)
    - [Win 32](#win-32)
        - [Utilties](#utilties)
        - [Gaming Stuff](#gaming-stuff)
        - [Programs that are rarely used or installed](#programs-that-are-rarely-used-or-installed)
    - [UWP or Windows Store apps](#uwp-or-windows-store-apps)
        - [For all computers](#for-all-computers)
    - [Other Windows features](#other-windows-features)
        - [Command-line utilties](#command-line-utilties)
        - [WSL (Windows subsystem for Linux)](#wsl-windows-subsystem-for-linux)
    - [MS Office plugins](#ms-office-plugins)

These are Windows programs that are not able to be installed via chocolatey

## Win 32

- [Zotero](https://www.zotero.org/)
    - reference manager that is free and open source very good alternative to EndNote and other alternatives (in my opinion it is better in pretty much every way)
- [ProWritingAid](https://prowritingaid.com/)
    - this is a program and chrome plugin (and others) that is a very comprehensive in its ability to check far more grammer issues than most other alternatives (not free serial number in Enpass)

### Utilties

- [Logitech Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html)
    - for mouse and keyboard
- [iCUE](https://www.corsair.com/us/en/icue)
    - for corsair headset

### Gaming Stuff

Gaming launcher programs that contain games I've owned (I don't use these much anymore)

- [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop)
- [Bethesda.net launcher](https://bethesda.net/en/game/bethesda-launcher)
- [Blitz.gg](https://blitz.gg/)

### Programs that are rarely used or installed

- [Audials](https://audials.com/en)
    - desktop audio recorder
    - licence is in Enpass
- [MusicBrainz Picard](https://picard.musicbrainz.org/) 
    - mp3 information tagger
    - free
- [Stata](https://www.stata.com/)
    - statistical software
    - you need to sign in to download
        - they also give you a download limit so I put my copy of the installer into OneDrive
        - licence is in Enpass
- [aTube Catcher](https://www.atube.me/)
    - youtube downloader
    - free
    - be very careful installed they have a bunch of shareware (not harmful but really annoying) they install if you're not reading carefully
- [Stamp](https://freeyourmusic.com/)
    - this allows you to move playlists and liked songs from one service to another
    - licence is in Enpass

## UWP or Windows Store apps

### For all computers

- Nextgen Reader (RSS reader)
- Spotify (Music)
- MS ToDo (ToDo application)
- ReadAloud (TTS that is easy to use)
- Your Phone (Send texts from computer)
- Enpass (Password manager)
- Audible (Audiobooks)

## Other Windows features

Other instructions regarding Windows features to use when needed

TODO: need to look through my various notes to add here

### Command-line utilties

1. nodejs
    1. this is I think the main way that most people to get javascript onto Windows
    1. I use this for programmatically looking at office documents I use this pretty rarely
    1. choco install nodejs
    1. npm install xml-formatter jszip

### WSL (Windows subsystem for Linux)

1. Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
1. You'll need to restart after this
1. Then download the version of linux from the Windows store you want (probably Ubuntu)
1. You'll be prompted to create a username and password
1. Type in these two commands to update stuff

    ```cmd
    Sudo apt update
    Sudo apt upgrade
    ```

1. Install anaconda
    1. You need to download from the anaconda repo located here check for the latest version that says linux-x86_64.sh at the end then download it using the url with wget in front of it
    1. Here is the url to find the latest https://repo.continuum.io/archive/

    ```cmd
    wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    ```

    1. Put in the command bash followed by the name of the file that you downloaded to install and follow the prompts
    
    ```cmd
    bash Anaconda3–2019.03-Linux-x86_64.sh
    ```

    1. to uninstall if you want

    ```cmd
    rm Anaconda3-2019.03-Linux-x86_64.sh
    ```

    1. Start up anaconda

    ```cmd
    source /home/ldsands/anaconda3/bin/activate
    ```

    1. Update conda packages

    ```cmd
    conda update --all
    ```

1. To start jupyter

    ```cmd
    jupyter notebook --no-browser this will provide a link that you can put into your browser
    ```

## MS Office plugins

I rarely use these but they're very useful

1. Dictate
    1. I haven't used this much but the dictation addon is pretty good and its free
1. Onetastic
    1. useful for using OneNote utilties I haven't used it in a long time but when I used OneNote a lot it was very useful
