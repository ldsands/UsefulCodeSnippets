# Windows programs

- [Windows programs](#windows-programs)
    - [Important Windows Settings](#important-windows-settings)
    - [Package Managers](#package-managers)
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

## Important Windows Settings

- When dual booting Windows and Linux, there will be a time conflict. To fix this it is better to modify Windows rather than Linux
    - The easiest way to do this is to modify the registry to make Windows use UTC (like Linux) rather than local time zones create a `.reg` file and add the code below. Then execute the file to change the registry. I got this code from [here](https://github.com/ShahriarDhruvo/Windows-Universal-Time-Registry/blob/master/Windows%20Universal%20Time%20-%20On.reg).
        - This will NOT change the time that Windows displays instead it assumes that the time recorded on the motherboard is in UTC rather than local time. Windows will still correctly use the local time in Windows but when loading Linux and Windows they will both assume that the time listed on the motherboard is UTC which fixes the time conflict issue.

        ```.reg
        Windows Registry Editor Version 5.00

        [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
        "RealTimeIsUniversal"=dword:00000001
        ```

## Package Managers

There are three main package managers for Windows. Chocolaty, Scoop and Winget.

- [Chocolatey](https://chocolatey.org/packages) has by far the largest number of packages but it does require administrator rights for many of its packages. As such it can install pretty much anything that can be installed on Windows.
- [Scoop](https://scoop.sh/) is a lot like chocolatey but does not require any administrator rights. Because of this it can be vary useful to use on a machine at work or somewhere similar. A side effect of this benefit is that it installs all of the programs that you install with scoop in the `~\scoop` folder. This means that these programs will not be added to path and will not show up in your start folder and other similar benefits. [Here](https://github.com/lukesampson/scoop/wiki/Chocolatey-Comparison) is a good write of of a comparison between chocolatey and scoop.
- Finally [Winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/) is a new (released first alpha in Spring 2020) package manager that is officially supported by Microsoft. It will have all of the capabilities of both Chocolatey and Scoop once it is feature complete as well as some that the other two will not have. The major benefit of using Winget is that all of the packages accessible through Winget will be vetted by Microsoft. Also because of it's "official" nature it already has a very large repository of programs and is growing much faster than Chocolatey or Scoop.

- Useful package manager links:
    - [Simple tutorial for Chocolatey and Scoop](https://dev.to/bowmanjd/chocolatey-vs-scoop-package-managers-for-windows-2kik)

## Win 32

Below are Windows programs that are installed using chocolatey or winget

- [Google Chrome](https://www.google.com/chrome/) I install this using Chocolatey
    - The most popular browser I personally prefer the new version of Edge but old habits die hard
- [Visual Studio Code or VS Code](https://code.visualstudio.com/) I install this using Chocolatey
    - A truly incredible text editor that is really in IDE in capabilities for many programming languages
    - For me writing in anything else is frustrating because of other programs limitations
    - For more information on my VS Code setup and other tips see [this other markdown sheet](../vscode.md)
- [7+ Taskbar Tweaker](https://tweaker.rammichael.com/) This can be installed using Winget
    - A taskbar settings application that allows for a lot of customization of Windows taskbar.
    - My settings that I usually use are as follows:
        - Taskbar items: Dropping: select "Open with"
        - Taskbar items: Pinned items: select "Remove extra gap between items"
        - Grouping and combining: Grouping: select "Don't group" and "When not grouping, place new items next to the existing ones"
        - Grouping and combining: Combining: select "Don't combine grouped buttons"
        - Other taskbar options: Other: select "Hide the "Show desktop" button"
- [7-Zip](https://www.7-zip.org/) I install this using Chocolatey
    - For all of your compression and decompression needs free and open source and very capable
- [Calibre](https://calibre-ebook.com/) I install this using Chocolatey
- [Bottom](https://github.com/ClementTsang/bottom) I install this using Chocolatey
    - This is a process explorer that is both very capable but also lightweight and runs in a terminal. I usually use this command to launch it `btm --group --battery --dot_marker --hide_table_gap --mem_as_value`
    - I use this for converting pdfs to epubs and for reading epubs
- [DiskGenius](https://www.diskgenius.com/download.php) I install this using the 64 bit portable version available at the link here
    - This is a very capable disk partition manager, I need this for any use of setting GPT or MBR of a drive which with stock Windows can only be done using a cmd utility
- [Ditto](https://github.com/sabrogden/ditto) I install this using Chocolatey
    - This is a great clipboard manager for Windows. You can now also use `win` + `v` for a similar built in program
- [Files](https://files-community.github.io/) I install this via the Microsoft Store
    - This is a replacement for file explorer with more useful features
- [Git](../git.md) I install this using Chocolatey
    - This is required for using github it is the source control software on which github is based
    - I don't know much about how to use git without either github and/or vscode
- [Pandoc](../pandoc_commands.md) I install this using Chocolatey
    - This can convert just about any document format into any other
    - I use it primarily to write in markdown and then convert to either docx or pdf depending on my need at the time
- [R](../../programming_languages/R/r_resources.md) I install this using Chocolatey
    - R is a statistically focused programming language it is really quirky but very powerful from a statistical point of view
- [Nodejs](https://nodejs.org/en/) I install this using Chocolatey
    - This is for installing javascript it has occasionally been useful to me in the past for electron apps and other applications
- [SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf) I install this using Chocolatey
    - This is a super lightweight pdf reader I use it when working LaTeX since it doesn't have a file lock
- [Dotnetcore-sdk](https://dotnet.microsoft.com/download/dotnet-core) I install this using Chocolatey
    - Used for my C# programming (I wish I could use it more but alas time never seems to allow me to experiment)
- [Julia](../../programming_languages/julia/julia.md) I install this using Chocolatey
    - Julia is a programming language that is python but rewritten for speed (there are lots of other benefits but speed is what I use it for) I have been able to get some scripts running thousands of times faster when I rewrote them Julia
    - Julia is still really new though so it is limited in the available packages but again otherwise I wish I could write only in Julia
- [ImageMagick](https://imagemagick.org/) I install this using Chocolatey
    - This is an image utility that is used by the command line. For example you can copy and convert files to the `avif` format (very new very good for saving space) to save space `magick .\image.jpg image.avif`
- [FiraCode NF](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) I install this using Chocolatey
    - My favorite coding font, much better than the defaults it also hase font ligatures which are useful in programming and supports [PowerLine](https://github.com/Jaykul/PowerLine)
- CascadiaCode Nerd Font I install this using Chocolatey
    - Another excellent font for coding that included ligatures and glyphs it can be found on GitHub [here](https://github.com/ryanoasis/nerd-fonts/tree/606db3752d4e6d31a2f47258ce86f7bb07511521/patched-fonts/CascadiaCode)
- [PeaZip](https://peazip.github.io/) I install this using Chocolatey
    - a good alternative to 7-zip that includes the zstandard codec
- [R Studio] I install this using Chocolatey
    - The defacto R programming IDE, I don't really like it much because it is ridiculously slow to use and I can do almost everything that I can in R Studio in VS Code, occasionally however I jump into R.Studio for the variable explorer and other little things
- [Texlive](https://tug.org/texlive/) I install this using Chocolatey
    - Another LaTeX installer, this one is a bit more comprehensive than MikTeX is
- [Textify](https://rammichael.com/textify) I install this using winget
    - A simple program that allows for copying text from pretty much any program
- [Zotero](zotero.md) I install this using Chocolatey
    - My preferred reference manager that is free and open source very good alternative to EndNote and other alternatives (in my opinion it is better in pretty much every way)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/) I install this using Chocolatey
    - Sometimes chrome cannot load something so I usually use Firefox as my back up
- [Discord](https://discord.com/) I install this using Chocolatey
    - Although primarily used for gaming it is among the best video and phone over IP programs that I've ever used
- [Logitech-options](https://support.logi.com/hc/en-us/articles/360025297893-Logitech-Options) I install this using Chocolatey
    - I love my logitech mice so I always install this to take advantage of customizing my mouse buttons
- [TeamViewer](https://www.teamviewer.com/en/) I install this using Chocolatey
    - When I can get it to work its very useful to be able to access my home computer from school or on my laptop
- [Telegram](https://telegram.org/) I install this using Chocolatey
    - This is my main messenger for personal chats (I would probably use Microsoft Teams but notifications are inconsistent on mobile)
- [QuickLook](https://github.com/QL-Win/QuickLook) I install this using Chocolatey
    - This is used to easily and quickly preview files in windows explorer using the `spacebar` when having a file selected
    - I also install the epub and MS office previewers found on [this page](https://github.com/QL-Win/QuickLook/wiki/Available-Plugins)
- [Hwmonitor](https://www.cpuid.com/softwares/hwmonitor.html) I install this using Chocolatey
    - I don't use this much either but it is very good and showing hardware resource usage, its useful for tracking down hardware problems or if you happen to be using a ton of CPU on something it can help you track down whats using it
- [VLC](https://www.videolan.org/vlc/) I install this using Chocolatey
    - A video (and audio) player that plays pretty much anything you throw at it
- [Krita](https://krita.org/en/) - [Krita documentation](https://docs.krita.org/en/)
    - This is kind of like a PhotoShop but quite a bit simpler (or so I'm told). I use it primarily for modifying svg type images since doing so in Krita is pretty simple but also able to do everything I want to do with it.
- [PDF-XChange Editor Plus](https://www.tracker-software.com/product/pdf-xchange-editor) I use a portable version of this application
    - There is a free version that includes most of the features of the program
    - [I have a separate file that details how I setup and use this program](PDFXChangeEditor.md)
- [PotPlayer](https://potplayer.daum.net/) I install this using Chocolatey
    - An audio player that allows for variable speed playback
    - It also allows me to pause using bluetooth controls (VLC doesn't do this)

Below are Windows programs that are not able to be installed via chocolatey that I always install

- [ProWritingAid](https://prowritingaid.com/)
    - This is a program and chrome plugin (and others) that is a very comprehensive in its ability to check far more grammar issues than most other alternatives (not free serial number in Enpass)

### Nativefier

Nativefier is an electron wrapper that can turn any website into a desktop application. It is very useful for obvious reasons. To install nativefier enter the following code after you have installed node.js:

```PowerShell
# install node.js using chocolatey
choco install nodejs
# test install
node -v
# if the above doesn't work you need to enter these two paths into your path environment variable
C:\Users\%username%\AppData\Roaming\npm
C:\Program Files\nodejs
# to install nativefier
npm install nativefier -g
# to update nativefier (you must have admin privileges) you should update npm first then update nativefier (the command below updates npm and then nativefier)
npm update -g npm && npm update -g nativefier
# it is also a good idea to create a folder just for nativefier below is where I put it
New-Item -Path 'C:\tools\nativefier' -ItemType Directory
# now navigate to the folder to create the nativefier program there
cd C:\tools\nativefier
```

The options are all explained [here](https://github.com/jiahaog/nativefier/blob/HEAD/docs/api.md).

- Some notable options
    - `--hide-window-frame` disables window frame and controls.
    - `--single-instance` you can only have one window of this open at a time
    - `--internal-urls ".*?"` if you want any domain to be able to work in the nativefier window
    - `--portable` "Make your app store its user data (cookies, cache, etc) inside the app folder"

Some Nativefier Limitations

- You cannot use `ctrl` + `f` to use find in page

Below are a list of the nativefier apps that I install with their code.

```PowerShell
# outlook personal
nativefier https://outlook.live.com/mail/0/inbox --name "Outlook" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/microsoft-outlook-2019-240.ico --maximize
# outlook personal single instance with tray icon
nativefier https://outlook.live.com/mail/0/inbox --name "Outlook" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/microsoft-outlook-2019-240.ico --maximize
# Uiowa outlook site
nativefier --name "Uiowa Outlook" "https://outlook.office365.com/mail/inbox" --internal-urls ".*(office|office365|officeonline|microsoftonline|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --single-instance --tray --counter --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.ico --maximize
# Uiowa outlook site single instance with trey icon
nativefier --name "Uiowa Outlook" "https://outlook.office365.com/mail/inbox" --internal-urls ".*(office|office365|officeonline|microsoftonline|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.ico --maximize
# ICON site
nativefier --name "ICON" "https://uiowa.instructure.com" --internal-urls ".*(uiowa|instructure)\.(com|edu).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/icon_uiowa_edu.ico --maximize
# ProWritingAid editor site
nativefier --name "ProWritingAid" "https://prowritingaid.com/en/Analysis/Documents/Go" --internal-urls ".*prowritingaid.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\ProWritingAid.ico --maximize
# Todoist site loads to the upcoming view
nativefier --name "Todoist" "https://todoist.com/app/#upcoming" --internal-urls ".*todoist.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\todoist.ico --maximize
# Todoist site loads to the upcoming view
nativefier --name "Todoist Beta" "https://beta.todoist.com/app/#upcoming" --internal-urls ".*todoist.com.*" --icon C:\Users\ldsan\OneDrive\Pictures\NativefierIcons\todoist.ico --maximize --portable
# Microsoft Teams
nativefier --name "MS Teams" "https://teams.microsoft.com/" --internal-urls ".*(office|office365|sharepoint|microsoft|microsoftonline|onenote)\.(com).*" --icon C:/Users/ldsan/OneDrive/Pictures/NativefierIcons/MSTeams-icon-96x96.ico --maximize
```

### Utilities

non chocolatey utility programs

- [Focus To-Do](https://www.focustodo.cn/) This is a to-do focused Pomodoro timer. I don't really use the to-do aspect of it but I like the timer aspect quite a bit
- [Gephi](https://gephi.org/) this is network visualization software that is open source. This can be installed using winget: `winget install --id=Gephi.Gephi -e`. To install it you must download it along with the java 8 sdk and apache maven. The code to install those two are as follows: `jdk8` and `choco install maven`
- [Glances]
- [Kite](https://kite.com/) this is a utility to help with python autocompletion
- [Logitech Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html) For my old keyboard because apparently the "gaming" keyboard needs different software the from the other logitech products
- [Pipx](https://pipxproject.github.io/pipx/) This allows you to use python scripts as though they were programs this does get installed via pip (`pip -m install pipx`) after installing python then add pipx to path by using this command: `python -m pipx ensurepath`. You will have to restart the PowerShell to use pipx.
- [PowerLine a terminal path  visual enhancement](https://github.com/Jaykul/PowerLine) oh-my-posh poshgit
- [PowerLine for PowerShell](../powershell.md#PowerShell-profiles)
- [Process Hacker](https://processhacker.sourceforge.io/) Is a process manager and viewer that is far more informational than the built in task manager. I use the [nightly builds](https://processhacker.sourceforge.io/nightly.php) since they have not updated the main release in years.
- [SylphyHornEx](https://github.com/ViRb3/SylphyHornEx/releases) The best Windows virtual desktop manager I've found very capable and customizable
- [WindowsTerminalHere](https://github.com/shanselman/WindowsTerminalHere) A small script to allow for use of the new windows terminal from any location by right clicking
- [iCUE](https://www.corsair.com/us/en/icue) For corsair headset
- [Glances](https://nicolargo.github.io/glances/) Since sometimes process hacker is targeted by Windows Defender I use bottom or glances. Glances can be installed via python pip (`pip install glances`) or even better via pipx (`pipx install glances`) so that it can remain isolated.
<!-- - [Pomotroid](https://splode.github.io/pomotroid/) this is a simple but customizable Pomodoro timer I use it pretty regularly -->
<!-- - [Stretchly](https://hovancik.net/stretchly/) A relatively simple but customization work/break timer can be installed using Winget -->

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
    - Desktop audio recorder
    - Licence is in Enpass
- [MusicBrainz Picard](https://picard.musicbrainz.org/)
    - Mp3 information tagger
    - Free
- [Stata](https://www.stata.com/)
    - Statistical software
    - You need to sign in to download
        - They also give you a download limit so I put my copy of the installer into OneDrive
        - Licence is in Enpass
- [aTube Catcher](https://www.atube.me/)
    - Youtube downloader
    - Free
    - Be very careful installed they have a bunch of shareware (not harmful but really annoying) they install if you're not reading carefully
- [Stamp](https://freeyourmusic.com/)
    - This allows you to move playlists and liked songs from one service to another
    - Licence is in Enpass

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

- Nodejs
    - This is I think the main way that most people to get javascript onto Windows
    - I use this for programmatically looking at office documents I use this pretty rarely
    - Choco install nodejs
    - Npm install xml-formatter jszip

### WSL (Windows subsystem for Linux)

WSL allows for using the linux kernel from within Windows. To install WSL follow the instructions contained on [this site](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and to enable WSL2 use [this site](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install). Below is a short version all put together.

- Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
- You'll need to restart after this
- Then download the version of linux from the Windows store you want (probably Ubuntu)
    - Make sure you launch after that and then your distro will install
- You'll be prompted to create a username and password
    - You'll want to check that your distro is running on WSL 2 and WSL 1 you can do this by entering `wsl -l -v` into PowerShell
    - To change a distro from WSL 1 to WSL 2 (or visa versa if you change the numbers) enter this code into PowerShell `wsl --set-version <Distro> 2`
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

- To get to the settings for FancyZones go to this location `C:\Users\%username%\AppData\Local\Microsoft\PowerToys\FancyZones\zones-settings.json`.

## MS Office Plugins

I rarely use these but they're very useful

- Dictate
    - I haven't used this much but the dictation addon is pretty good and its free
- Onetastic
    - Useful for using OneNote utilities I haven't used it in a long time but when I used OneNote a lot it was very useful
