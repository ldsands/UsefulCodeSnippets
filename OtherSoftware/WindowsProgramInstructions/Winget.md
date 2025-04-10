# Winget

Windows Package Manager or winget is the new package manager for Windows that is created and supported by Microsoft. Due to the more official nature of the tool I will be using it over [chocolaty](Chocolatey.md) where possible. Winget documentation can be found [here](https://docs.microsoft.com/en-us/windows/package-manager/winget/). A well done gui program for looking through packages that are available can be downloaded from [here](https://github.com/handyorg/handywinget-gui). There are also a couple websites that collects all of the packages and makes it pretty easy to get the terminal commands for each package. I prefer [this website](https://winget.run/) at the moment (July 2020) [this one](https://winstall.app/) has some other useful features too though.

## Winget Commands

The commands below are copied from the `winget -h` command

```pwsh
install    Installs the given package
show       Shows information about a package
source     Manage sources of packages
search     Find and show basic info of packages
list       Display installed packages
upgrade    Shows and performs available upgrades
uninstall  Uninstalls the given package
hash       Helper to hash installer files
validate   Validates a manifest file
settings   Open settings or set administrator settings
features   Shows the status of experimental features
export     Exports a list of the installed packages
import     Installs all the packages in a file
```

The commands I find most useful

```pwsh
winget upgrade # this will list all available package upgrades
winget upgrade --source winget --all # this will upgrade all packages that come from winget
winget upgrade --all # this will upgrade all available package upgrades
winget list # this will list all the install applications including applications not installed via winget
winget list --source winget  # this will list all the applications installed via winget
winget --reset # resets the winget cache
```

## WingetUI install

- [UniGetUI](https://github.com/marticliment/UniGetUI) - One of the most useful programs to install which is a Winget Management GUI (it also can manage Scoop and Chocolatey packages too).
    - [In 2024 they changed the name from "WingetUI"](https://github.com/marticliment/UniGetUI/discussions/1900).
    - To install it use the command below:

```pwsh
winget install UniGetUI --source winget # UniGetUI a winget GUI
winget install --id=SomePythonThings.WingetUIStore  -e # UniGetUI a winget GUI
```

## Winget Applications

A list of applications to install using Winget are below:

```sh
winget install --id QL-Win.QuickLook -e
winget install --id rammichael.7+TaskbarTweaker -e
winget install --id rammichael.Textify -e
winget install --id=9NGHP3DX8HDX -e # [Files App](https://files.community/)
winget install --id=Amazon.Kindle -e
winget install --id=AntibodySoftware.WizFile  -e # like everything but has some more features (except networked drives)
winget install --id=AntibodySoftware.WizTree  -e # like WinDirStat but way faster
winget install --id=Bostrot.WSLManager -e # WSL Manager can also be installed in many other ways
winget install --id=ChristianSchenk.MiKTeX -e
winget install --id=Discord.Discord -e
winget install --id=Docker.DockerDesktop  -e # docker desktop
winget install --id=EpicGames.EpicGamesLauncher -e
winget install --id=File-New-Project.EarTrumpet -e
winget install --id=Flow-Launcher.Flow-Launcher  -e # launcher might be better than PowerToys run
winget install --id=GOG.Galaxy -e
winget install --id=Gephi.Gephi -e
winget install --id=Julialang.Julia -e
winget install --id=KDE.KDEConnect -e
winget install --id=LINQPad.LINQPad -e
winget install --id=Lexikos.AutoHotkey -e
winget install --id=LibreOffice.LibreOffice -e
winget install --id=Microsoft.EdgeBeta -e
winget install --id=Microsoft.PowerShell -e
winget install --id=Microsoft.PowerToys -e
winget install --id=Microsoft.Teams -e
winget install --id=Microsoft.VisualStudioCode -e
winget install --id=Microsoft.WindowsTerminalPreview -e
winget install --id=Microsoft.dotnet -e
winget install --id=Min.Min -e
winget install --id=MiniTool.PartitionWizard.Free  -e # MiniTool Partition for managing partitions
winget install --id=Mozilla.Firefox -e
winget install --id=NickeManarin.ScreenToGif
winget install --id=Nvidia.Broadcast -e
winget install --id=OBSProject.OBSStudio -e
winget install --id=Playnite.Playnite -e
winget install --id=Python.Python -e
winget install --id=RProject.R -e
winget install --id=RStudio.RStudio -e
winget install --id=RiotGames.LeagueOfLegends -e
winget install --id=Rust.rustup -e
winget install --id=ShareX.ShareX -e
winget install --id=Signal.Signal -e
winget install --id=SoftDeluxe.FreeDownloadManager  -e # Free Download Manager
winget install --id=SpeedCrunch.SpeedCrunch -e
winget install --id=Spotify.Spotify -e
winget install --id=Stretchly.Stretchly -e
winget install --id=SumatraPDF.SumatraPDF -e
winget install --id=TimKosse.FilezillaClient -e
winget install --id=Ubisoft.Uplay -e
winget install --id=Valve.Steam -e
winget install --id=VideoLAN.VLC -e
winget install --id=Zoom.Zoom -e
winget install --id=jurplel.qView  -e # simple image viewer that is cross-platform
winget install --id=twitch.twitch -e

# stuff to evaluate

winget install --id=Microsoft.Sysinternals.Autoruns -e
winget install --id=Microsoft.Sysinternals.ProcessExplorer -e
winget install --id=Microsoft.Sysinternals.ProcessMonitor -e
winget install --id=9P7KNL5RWT25 -e #Sysinternals Suite
winget install --id=Bitwarden.Bitwarden -e # probably will be better than Enpass but I haven't take the time to migrate
winget install --id=PrestonN.FreeTube  -e # for watching YouTube on Windows
winget install --id=Zidoro.Pomatez  -e # A Pomodoro timer that is cross platform
winget install --id=RandomEngy.VidCoder  -e # for converting video files (to save space) uses handbreak on the backend (can also keep media creating date so that it works with programs like google photos)
winget install --id=ToEverything.AFFiNE  -e # Notion/Obsidian alternative that is Open Source


# old programs that I don't use anymore
winget install --id=DuongDieuPhap.ImageGlass -e # image viewer (doesn't seem to update via winget as easily as qView)
winget install --id=WinDirStat.WinDirStat -e # use WizTree instead
winget install --id=agalwood.Motrix -e # updates have pretty much stopped
winget install --id=voidtools.Everything -e # use WizFile instead it has some more features (except networked drives)
```

winget install bottom
