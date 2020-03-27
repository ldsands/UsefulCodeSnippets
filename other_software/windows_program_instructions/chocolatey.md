# Chocolatey

a package manager for Windows, using this makes setting up a Windows computer WAY faster and easier

## Install chocolatey

make sure you open powershell as an administrator otherwise chocolatey will not be able to install

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

## Install programs

groups of programs installed through chocolatey

again always run chocolatey in powershell with administrator privileges otherwise it is not likely to work for most programs

### Install on all computers

```PowerShell
choco install googlechrome vscode 7zip.install git gh github-desktop pandoc powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"' r.project --params '"/AddToPath"' microsoft-windows-terminal oh-my-posh poshgit nodejs sumatrapdf dotnetcore-sdk paket docker-desktop julia firacodenf powertoys r.studio miktex zotero firefox discord logitech-options chocolateygui teamviewer hwmonitor vlc -y
```

### Large installs

these one takes a long time so I usually install them separately

```PowerShell
choco install anaconda3 --params '"AddToPath"' -y
choco install office365proplus -y
```

### Non-productive software which I only install on my gaming computer

```PowerShell
choco install steam origin goggalaxy uplay leagueoflegends twitch epicgameslauncher -y
```

### For computers with nvidia video cards

```PowerShell
choco install geforce-experience -y
```

### Rarely installed

- [youtube-dl](https://ytdl-org.github.io/youtube-dl/index.html) is a youtube downloader CLI that downloads youtube videos with tons of options
- [OBS (Open Broadcaster Software)](https://obsproject.com/) is an audio and video management software suite that is open source. It is primarily used for streaming/podcasting types of applications. I'm adding this here for the coronavirus fiasco so make my video not so terrible
- ccleaner is a program that can clean windows of files that aren't needed. Windows 10 has come a long way since the last time I used this software and it really isn't needed anymore.

```PowerShell
choco install youtube-dl
choco install obs-studio
choco install ccleaner -y
```
