# Chocolatey

a package manager for Windows, using this makes setting up a Windows computer WAY faster and easier

## Install chocolatey

make sure you open powershell as an administrator otherwise chocolatey will not be able to install

```{powershell}
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

## Install programs

groups of programs installed through chocolatey

again always run chocolatey in powershell with administrator privileges otherwise it is not likely to work for most programs

### Install on all computers

```{powershell}
choco install googlechrome vscode 7zip.install git pandoc nodejs sumatrapdf dotnetcore-sdk julia firacode r.studio miktex zotero firefox discord logitech-options chocolateygui teamviewer hwmonitor vlc -y
```

These need additional parameters to install correctly or to be added automatically to path

```{powershell}
choco install r.project --params '"/AddToPath"' -y
```

### Large installs

these one takes a long time so I usually install them separately

```{powershell}
choco install anaconda3 --params '"AddToPath"' -y
choco install office365proplus -y
```

### Non-productive software which I only install on my gaming computer

```{powershell}
choco install steam origin goggalaxy uplay leagueoflegends twitch epicgameslauncher -y
```

### For computers with nvidia video cards

```{powershell}
choco install geforce-experience -y
```

### Rarely installed

```{powershell}
choco install ccleaner -y
```
