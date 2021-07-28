# Chocolatey

a package manager for Windows, using this makes setting up a Windows computer WAY faster and easier

Note: in May of 2020 Microsoft released their own package manager that I will slowly be using over chocolatey

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
# I use some code that can only be run on modern PowerShell so install that first
choco install  powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"'

# each of these loops install chocolatey packages that are organized by type of program
$Packages = "firefox", "googlechrome", "microsoft-edge-insider"
Write-Host "Installing Browsers"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "git", "microsoft-windows-terminal", "nodejs", "pandoc", "texlive"
Write-Host "Installing Dev tools"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "cascadia-code-nerd-font", "fira", "firacodenf"
Write-Host "Installing Fonts"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "vlc"
Write-Host "Installing Media Programs"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "dotnet-sdk", "julia", "powershell-core", "python", "r.project --params `'`"/AddToPath`"`'", "typescript"
Write-Host "Installing Programming Languages"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "vscode", "r.studio"
Write-Host "Installing Text editors / IDEs"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "7zip", "bottom", "ditto", "everything", "hwmonitor", "powertoys", "starship"
Write-Host "Installing Utilities + other"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

$Packages = "discord", "imageglass", "logitech-options", "potplayer", "speedcrunch", "sumatrapdf", "zotero"
Write-Host "Installing Windows Applications"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}

# Others that I sometimes install but not usually
choco install paket docker-desktop boxstarter miktex chocolateygui teamviewer -y
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
- CCleaner is a program that can clean windows of files that aren't needed. Windows 10 has come a long way since the last time I used this software and it really isn't needed anymore.
- [Motrix](https://motrix.app/) is a download manager that can do several download related tasks automatically
- [PyIDM](https://github.com/pyIDM/PyIDM) is another download manager that I prefer to Mortix as it seems to work better. The Windows protable release can be downloaded from [here](https://github.com/pyIDM/PyIDM/releases)
- [windirstat](https://windirstat.net/) shows visually what files are taking up how much space on any drives that are connected to the computer

```PowerShell
choco install youtube-dl
choco install obs-studio
choco install ccleaner -y
choco install putty.install
choco install motrix
choco install windirstat
```

## Upgrading using chocolatey

To upgrade you first should probably check to see what packages need to be upgraded. The first two lines below do that (you do need both though I'm not really sure why). Then you can use the command `choco upgrade` and then the names of the packages you want to upgrade.

```PowerShell
choco outdated # checks all packages for updates
cup all -whatif # checks all packages for updates
choco upgrade chocolatey # updates chocolatey
```
