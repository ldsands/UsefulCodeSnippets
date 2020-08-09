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
    - [Windows PowerToys](#windows-powertoys)
    - [MS Office Plugins](#ms-office-plugins)

## Win 32

Below are Windows programs that are installed using chocolatey

- Google Chrome
    - the most popular browser I personally prefer the new version of Edge but old habits die hard
- Visual Studio Code or VS Code
    - a truly incredible text editor that is really in IDE in capabilities for many programming languages
    - for me writing in anything else is frustrating because of other programs limitations
    - for more information on my VS Code setup and other tips see [this other markdown sheet](../vscode.md)
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
    - the defacto R programming IDE, I don't really like it much because it is ridiculously slow to use and I can do almost everything that I can in R Studio in VS Code, occasionally however I jump into R.Studio for the variable explorer and other little things
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

```nodejs
# to install nativefier
npm install nativefier -g
# to update nativefier (you must have admin privileges)
npm update -g nativefier
```

The options are all explained [here](https://github.com/jiahaog/nativefier/blob/HEAD/docs/api.md).

- some notable options
    - `--hide-window-frame` disables window frame and controls.
    - `--single-instance` you can only have one window of this open at a time
    - `--internal-urls ".*?"` if you want any domain to be able to work in the nativefier window

Some Nativefier Limitations

- you cannot use `ctrl` + `f` to use find in page

Below are a list of the nativefier apps that I install with their code.

```PowerShell
# outlook personal
nativefier https://outlook.live.com/mail/0/inbox --name "Outlook" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/microsoft-outlook-2019-240.ico --maximize
# outlook personal single instance with tray icon
nativefier https://outlook.live.com/mail/0/inbox --name "Outlook" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/microsoft-outlook-2019-240.ico --maximize
# Uiowa outlook site
nativefier --name "Uiowa Outlook" "https://outlook.office365.com/mail/inbox" --internal-urls ".*(office|office365|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.ico --maximize
# ICON site
nativefier --name "ICON" "https://uiowa.instructure.com" --internal-urls ".*(uiowa|instructure)\.(com|edu).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/icon_uiowa_edu.ico --maximize
# ProWritingAid editor site
nativefier --name "ProWritingAid" "https://prowritingaid.com/en/Analysis/Documents/Go" --internal-urls ".*prowritingaid.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\ProWritingAid.ico --maximize
# Todoist site loads to the @MyDay label
nativefier --name "Todoist" "https://todoist.com/app#agenda%2F%40MyDay" --internal-urls ".*todoist.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\todoist.ico --maximize
# Microsoft Teams
nativefier --name "MS Teams" "https://teams.microsoft.com/" --internal-urls ".*(office|office365|sharepoint|microsoft|microsoftonline|onenote)\.(com).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/MSTeams-icon-96x96.ico --maximize
```

### Utilities

non chocolatey utility programs

- A small script to allow for use of the new windows terminal from any location by right clicking, [taken from a github repo](https://github.com/shanselman/WindowsTerminalHere)
- [Gephi](https://gephi.org/) this is network visualization software that is open source.
    - This can be installed using winget: `winget install --id=Gephi.Gephi -e`
    - to install it you must download it along with the java 8 sdk and apache maven. The code to install those two are as follows: `jdk8` and `choco install maven`
- [iCUE](https://www.corsair.com/us/en/icue)
    - for corsair headset
- [Kite](https://kite.com/) this is a utility to help with python autocompletion
- [Logitech Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html)
    - for keyboard because apparently the "gaming" keyboard needs different software the from the other logitech products
- [Pomotroid](https://splode.github.io/pomotroid/) this is a simple but customizable Pomodoro timer I use it pretty regularly
    - Update I now use Stretchly which is shown below
- [PowerLine a terminal path  visual enhancement](https://github.com/Jaykul/PowerLine) oh-my-posh poshgit
- [PowerLine for PowerShell](../powershell.md#PowerShell-profiles)
- [Stretchly](https://hovancik.net/stretchly/) A relativly simple but customization work/break timer can be installed using Winget

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

- nodejs
    - this is I think the main way that most people to get javascript onto Windows
    - I use this for programmatically looking at office documents I use this pretty rarely
    - choco install nodejs
    - npm install xml-formatter jszip

### WSL (Windows subsystem for Linux)

WSL allows for using the linux kernel from within Windows. To install WSL follow the instructions contained on [this site](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and to enable WSL2 use [this site](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install). Below is a short version all put together.

- Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
- You'll need to restart after this
- Then download the version of linux from the Windows store you want (probably Ubuntu)
    - make sure you launch after that and then your distro will install
- You'll be prompted to create a username and password
    - you'll want to check that your distro is running on WSL 2 and WSL 1 you can do this by entering `wsl -l -v` into PowerShell
    - to change a distro from WSL 1 to WSL 2 (or visa versa if you change the numbers) enter this code into PowerShell `wsl --set-version <Distro> 2`
- Type in these two commands to update stuff

    ```cmd
    sudo apt update
    sudo apt upgrade
    ```

- I'm a big fan of PowerShell mostly because it is the shell that I'm most familiar with. It is also usable on all platforms so you can learn PowerShell once and never have to learn much of any other terminal syntax no matter what platform you're using. To get it onto Linux find the instructions on [this site](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux). The instructions to do this on Ubuntu are located [here](../powershell.md#Using-PowerShell-on-Linux)
- Install Anaconda on WSL [see this section](../../programming_languages/python/python_install.md#Install-anaconda-on-WSL)
- Some useful PowerShell commands to use to manage the WSL distros are below [here](https://docs.microsoft.com/en-us/windows/wsl/reference) is a more comprehensive list of WSL commands

    ```PowerShell
    # list the wsl distros that are installed
    wsl --list --verbose
    # terminate a WSL distro from PowerShell
    wsl --terminate <distro name>
    ```

- Duplicating an installed distro can be useful for various reasons here is some code to do that which I found [here](https://stackoverflow.com/questions/51584765/how-do-you-install-multiple-separate-instances-of-ubuntu-in-wsl/60428590#60428590)

    ```PowerShell
    cd C:\Users\MattSlay
    wsl --export Ubuntu ubuntu.tar
    wsl --import UbuntuRuby .\UbuntuRuby ubuntu.tar
    wsl --import UbuntuPython .\UbuntuPython ubuntu.tar
    wsl --import UbuntuDotNet .\UbuntuDotNet ubuntu.tar
    wsl -d UbuntuRuby
    ```

## Windows PowerToys

"[Microsoft PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater productivity.](https://github.com/microsoft/PowerToys#overview)" I install PowerToys using [chocolatey](chocolatey.md/#choco-install-powertoys) `choco install powertoys`. Here are a few notes I have made about using PowerToys.

- to get to the settings for FancyZones go to this location `C:\Users\%username%\AppData\Local\Microsoft\PowerToys\FancyZones\zones-settings.json`.

## MS Office Plugins

I rarely use these but they're very useful

- Dictate
    - I haven't used this much but the dictation addon is pretty good and its free
- Onetastic
    - useful for using OneNote utilities I haven't used it in a long time but when I used OneNote a lot it was very useful
