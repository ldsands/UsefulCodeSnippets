# Windows programs

- [Windows programs](#windows-programs)
    - [Win 32](#win-32)
        - [Nativefier](#nativefier)
        - [Utilities](#utilities)
        - [Gaming Stuff](#gaming-stuff)
        - [Programs that are rarely used or installed](#programs-that-are-rarely-used-or-installed)
    - [UWP or Windows Store apps](#uwp-or-windows-store-apps)
        - [For all computers](#for-all-computers)
    - [Other Windows features](#other-windows-features)
        - [Command-line utilities](#command-line-utilities)
        - [WSL (Windows subsystem for Linux)](#wsl-windows-subsystem-for-linux)
    - [MS Office plugins](#ms-office-plugins)

## Win 32

Below are Windows programs that are installed using chocolatey

- Google Chrome
    - the most popular browser I personally prefer the new version of Edge but old habits die hard
- Visual Studio Code or VSCode
    - a truly incredible text editor that is really in IDE in capabilities for many programming languages
    - for me writing in anything else is frustrating because of other programs limitations
    - for more information on my VSCode setup and other tips see [this other markdown sheet](../vscode.md)
- 7zip
    - for all of your compression and decompression needs free and open source and very capable
- [git](../git.md)
    - this is required for using github it is the source control software on which github is based
    - I don't know much about how to use git without either github and/or vscode
- [pandoc](../pandoc_commands.md)
    - this can convert just about any document format into any other
    - I use it primarily to write in markdown and then convert to either docx or pdf depending on my need at the time
- [R](../../programming_languages/R/r_resources.md)
    - R is a statistically focused programming language it is really quirky but very powerful from a statistical point of view
- Nodejs
    - this is for installing javascript it has occasionally been useful to me in the past for electron apps and other applications
- SumatraPDF
    - this is a super lightweight pdf reader I use it when working LaTeX since it doesn't have a file lock
- dotnetcore-sdk
    - used for my C# programming (I wish I could use it more but alas time never seems to allow me to experiment)
- [Julia](../../programming_languages/julia/julia.md)
    - Julia is a programming language that is python but rewritten for speed (there are lots of other benefits but speed is what I use it for) I have been able to get some scripts running thousands of times faster when I rewrote them Julia
    - Julia is still really new though so it is limited in the available packages but again otherwise I wish I could write only in Julia
- FiraCode NF
    - my favorite coding font, much better than the defaults it also hase font ligatures which are useful in programming and supports [PowerLine](https://github.com/Jaykul/PowerLine)
- R Studio
    - the defacto R programming IDE, I don't really like it much because it is ridiculously slow to use and I can do almost everything that I can in R Studio in VSCode, occasionally however I jump into R.Studio for the variable explorer and other little things
- MikTeX
    - the defacto LaTeX installation for Windows I don't use LaTeX directly much anymore but pandoc uses it so I usually install it
- [Zotero](zotero.md)
    - my preferred reference manager that is free and open source very good alternative to EndNote and other alternatives (in my opinion it is better in pretty much every way)
- Firefox
    - sometimes chrome cannot load something so I usually use Firefox as my back up
- Discord
    - although primarily used for gaming it is the best video and phone over IP program that I've ever used
- logitech-options
    - I love my logitech mice so I always install this to take advantage of customizing my mouse buttons
- chocolateygui
    - I've almost never used this but it gives a GUI interface to chocolatey which has been useful once or twice in the past
- TeamViewer
    - when I can get it to work its very useful to be able to access my home computer from school or on my laptop
- hwmonitor
    - I don't use this much either but it is very good and showing hardware resource usage, its useful for tracking down hardware problems or if you happen to be using a ton of CPU on something it can help you track down whats using it
- VLC
    - a video (and audio) player that plays pretty much anything you throw at it

Below are Windows programs that are not able to be installed via chocolatey that I always install

- [ProWritingAid](https://prowritingaid.com/)
    - this is a program and chrome plugin (and others) that is a very comprehensive in its ability to check far more grammar issues than most other alternatives (not free serial number in Enpass)

### Nativefier

Nativefier is an electron wrapper that can turn any website into a desktop application. It is very useful for obvious reasons. To install nativefier enter the following code after you have installed node.js:

The options are all explained [here](https://github.com/jiahaog/nativefier/blob/HEAD/docs/api.md).

```nodejs
npm install nativefier -g
```

Some Nativefier Limitations

- you cannot use `ctrl` + `f` to use find in page

Here are a list of the nativefier apps that I install with their code following.

- Outlook.com
    - I've liked the outlook web app a long time so it is a must
- Uiowa Outlook.com
    - see above
- ICON
    - for using ICON for school very useful
- ProWritingAid
    - I use this for my grammar checking. I paid for the premium lifetime package a while ago and I've been pretty happy with it.

- some notable options
    - `--hide-window-frame` disables window frame and controls.
    - `--single-instance` you can only have one window of this open at a time
    - `--internal-urls ".*?"` if you want any domain to be able to work in the nativefier window

```PowerShell
nativefier https://outlook.live.com/mail/0/inbox --name "Outlook" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/microsoft-outlook-2019-240.ico --maximize
nativefier --name "Uiowa Outlook" "https://outlook.office365.com/mail/inbox" --internal-urls ".*(office|office365|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.ico --maximize
nativefier --name "ICON" "https://uiowa.instructure.com" --internal-urls ".*(uiowa|instructure)\.(com|edu).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/icon_uiowa_edu.ico --maximize
nativefier --name "ProWritingAid" "https://prowritingaid.com/en/Analysis/Documents/Go" --internal-urls ".*prowritingaid.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\ProWritingAid.ico --maximize
```

### Utilities

non chocolatey utility programs

- A small script to allow for use of the new windows terminal from any location by right clicking, [taken from a github repo](https://github.com/shanselman/WindowsTerminalHere)
- [PowerLine a terminal path  visual enhancement](https://github.com/Jaykul/PowerLine) oh-my-posh poshgit
- [PowerLine for PowerShell](../powershell.md#PowerShell-profiles)

- [Logitech Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html)
    - for keyboard because apparently the "gaming" keyboard needs different software the from the other logitech products
- [iCUE](https://www.corsair.com/us/en/icue)
    - for corsair headset

### Gaming Stuff

Gaming launcher programs that contain games I've owned that are on chocolatey (I don't use these much anymore)

- [Steam](https://store.steampowered.com/about/)
- [Origin](https://www.origin.com/usa/en-us/store/download)
- [Goggalaxy](https://www.gog.com/galaxy)
- [Uplay](https://uplay.ubisoft.com/en-US)
- [Leagueoflegends](https://signup.na.leagueoflegends.com/en/signup/redownload?page_referrer=index)
- [Twitch](https://www.twitch.tv/downloads)
- [Epicgameslauncher](https://www.epicgames.com/store/en-US/)

Gaming launcher programs that contain games I've owned that aren't on chocolatey (I don't use these much anymore)

- [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop)
- [Bethesda.net launcher](https://bethesda.net/en/game/bethesda-launcher)
- [Blitz.gg](https://blitz.gg/)

### Programs that are rarely used or installed

These are not available on chocolatey

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

### Command-line utilities

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
    1. [Here is the url](https://repo.continuum.io/archive/) to find the latest

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
    1. useful for using OneNote utilities I haven't used it in a long time but when I used OneNote a lot it was very useful
