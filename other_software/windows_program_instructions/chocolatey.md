# Chocolatey

a package manager for windows

## Install chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

## Install programs

groups of programs installed through chocolatey

### Install on all computers

```powershell
choco install googlechrome vscode 7zip.install git pandoc r.project nodejs sumatrapdf dotnetcore-sdk julia firacode r.studio miktex zotero firefox discord logitech-options chocolateygui teamviewer hwmonitor -y
```

### Large installs

these one takes a long time so I usually install them separately

```powershell
choco install anaconda3 --params '"AddToPath"' -y
choco install office365proplus -y
```

### Non-productive software which I only install on my gaming computer

```powershell
choco install steam origin goggalaxy uplay playnite leagueoflegends twitch epicgameslauncher vlc -y
```

### For computers with nvidia video cards

```powershell
choco install geforce-experience -y
```

### Rarely installed

```powershell
choco install ccleaner -y
```
