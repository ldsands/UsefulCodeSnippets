# Software Evaluation

This file is meant to allow me to keep track of software that I have tested, want to test, or am in the process of testing. This allows me to keep an eye programs that are in development that I may want to test in the future. It also allows me to keep track of which programs I have previously tested and why I don't think I'll ever use again.

Template entry:

- [Name of program](link to related website) - Description (usually taken from website) - **Platform** - Notes (when applicable)

- [Software Evaluation](#software-evaluation)
    - [Browser Extensions](#browser-extensions)
    - [Good Software Reference Table](#good-software-reference-table)
    - [Software to Evaluate in the Future](#software-to-evaluate-in-the-future)
    - [Software Under Evaluation](#software-under-evaluation)
    - [Software I Don't Think I'll Ever Use Again](#software-i-dont-think-ill-ever-use-again)

## Browser Extensions

- [ClearURLs](https://chrome.google.com/webstore/detail/clearurls/lckanjgmijmafbedllaakclkaicjfmnk) - 2020-07-05 15:42:43
- [I don't care about cookies](https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja) - 2020-07-05 15:42:43
- [Absolute Enable Right Click & Copy](https://chrome.google.com/webstore/detail/absolute-enable-right-cli/jdocbkpgdakpekjlhemmfcncgdjeiika) - 2020-07-05 15:42:43
- Look for something that does loudness equalization for the browser

## Good Software Reference Table

| Tags        | Name                                                        | Description (usually a direct quote or an quote I abbreviated)                            | Platform(s) | Preferred Installation Method(s)                           | Comments                                                                               |
| ----------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Color       | [Emulsion](https://github.com/lainsce/emulsion/)            | a color (scheme) picking/creating application                                             | Linux       | `flatpak install flathub io.github.lainsce.Emulsion`       | Simple easy to use                                                                     |
| Hardware    | [CPU-X](https://x0rg.github.io/CPU-X/)                      | A CPU-Z alternative for Linux (reports hardware information)                              | Linux       | Must use package manager (e.g. pacman)                     | I have rarely needed this information in the past this kind of program was very useful |
| Hardware    | [Piper](https://github.com/libratbag/piper)                 | GTK application to configure gaming devices                                               | Linux       | `flatpak install flathub org.freedesktop.Piper`            | For configuring my mouse                                                               |
| Image       | [GwenView](https://apps.kde.org/gwenview/)                  | fast and easy to use image viewer by KDE, browsing and displaying a collection of images. | Linux       | `flatpak install flathub org.kde.gwenview`                 | Very good image viewer                                                                 |
| Image       | [TextSnatcher](https://github.com/RajSolai/TextSnatcher)    | Perform OCR operations in seconds on Linux Desktop                                        | Linux       | `flatpak install flathub com.github.rajsolai.textsnatcher` | Easy to use image OCR                                                                  |
| TaskManager | [CoreStats](https://gitlab.com/cubocore/coreapps/corestats) | A system resource viewer for C Suite                                                      | Linux       | `flatpak install flathub org.cubocore.CoreStats`           | Very simple task manager                                                               |

## Software to Evaluate in the Future

- Other terminal options because although I really like Hyper it does take a lot of RAM
    - Install [Tabby](https://tabby.sh/) another terminal
        - download the `.deb` file from [the github releases page](https://github.com/Eugeny/tabby/releases)
    - [Alacritty](https://github.com/alacritty/alacritty)
        - To install you can use the following command after installing rust. `sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 && cargo install alacritty`
        - config options can be found [here](https://github.com/alacritty/alacritty/blob/master/alacritty.yml)
    - [Wez's Terminal Emulator](https://wezfurlong.org/wezterm/install/linux.html)
- [Android Apps on Linux](https://anbox.io/) instructions can be found [here](https://www.howtogeek.com/760044/how-to-run-android-apps-on-linux/) [here is a list of other alternatives](https://linuxhint.com/android_apps_games_linux/#:~:text=Best%20Way%20to%20Run%20Android%20Apps%20and%20Games,Genymotion.%20...%204%20Android-x86.%20...%20More%20items...%20)
- [Paru](https://github.com/morganamilo/paru) this is a lot like yay but written in Rust and I have a lot of other Rust based command line programs that I use so I may switch to it at some point. Yay does install much easier in Manjaro since they have it in their repo so for now I'll stick with yay.
    - To install you can use pacman: `sudo pacman -S --needed base-devel` and then you can either use cargo or git.
        - cargo `cargo install paru`
        - `pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
        - Until I can install this using pacman I probably won't use it in the meantime i'll keep using yay (updated 2022-01-22)
- [Sticky](https://github.com/collinss/sticky)
    - A possible alternative to KNotes
- a browser for organizing web apps (e.g. email) - [A useful list compiled in Apr 2022](https://www.reddit.com/r/getferdi/comments/u2vkl4/best_alternatives_now_that_ferdi_is_gone/)
    - [Ferdi](https://getferdi.com/)
        - installed using flatpak `flatpak install flathub com.getferdi.Ferdi`
    - [Tangram](https://github.com/sonnyp/Tangram)
        - installed using flatpak `flatpak install flathub re.sonny.Tangram`
    - [WebCatalog](https://webcatalog.io/webcatalog/)
        - "Turn Any Websites into Real Desktop Apps" I plan to mostly use this for email and calendaring
        - installed via appimage (can find via [AppImageHub](https://www.appimagehub.com/))
- email applications
    - [Bluemail](https://bluemail.me/) - free, beautifully designed, universal email app - Cross-Platform - AUR
    - [Thunderbird](https://www.thunderbird.net/en-US/) - free email application - Cross-Platform - `flatpak install flathub org.mozilla.Thunderbird`
        - It is very good and customizable most of my issues are more with outlook.com working with Thunderbird not thunderbird itself - also use Birdtray for the trey
- Audio modification software
    - [EasyEffects](https://github.com/wwmm/easyeffects)
        - Audio effects for PipeWire applications
        - installed using flatpak `flatpak install flathub com.github.wwmm.easyeffects`
- [Xonsh](https://xon.sh/) a cross-platform shell that is written in and uses python
    - `yay -S xonsh`
    - [tutorial](https://xon.sh/tutorial.html) or use the command `xonfig tutorial`
    - `xonfig web` # Run the configuration tool in the browser to create ~/.xonshrc
    - [xensh cheatsheet](https://github.com/anki-code/xonsh-cheatsheet)
    - recommended ways to install
        - `python -m pip install 'xonsh[full]'`
        - `pip install pipx && pipx install --python python3.10 xonsh && pipx run xonsh`
    - xontribs to look at
        - [xonsh-autoxsh](https://github.com/Granitosaurus/xonsh-autoxsh)
        - [xontrib-kitty](https://github.com/scopatz/xontrib-kitty)
        - <https://github.com/anki-code/xontrib-prompt-starship>
        - <https://github.com/dyuri/xontrib-langenv>
        - <https://github.com/AstraLuma/xontrib-z>
        - <https://github.com/dyuri/xontrib-zoxide>
        - <https://github.com/anki-code/xontrib-argcomplete>
        - whole_word_jumping
- App/work timers
    - [Flowtime](https://github.com/Diego-Ivan/Flowtime) "Assistant for the Flowtime working technique"
        - A simple Pomodoro timer
        - Installed using flatpak `flatpak install flathub io.github.diegoivanme.flowtime`
    - [Workflow](https://gitlab.com/cunidev/workflow) "A screen time monitor app for Linux. Needs ActivityWatch to be installed (see below)."
        - Installed using flatpak `flatpak install flathub com.gitlab.cunidev.Workflow`
        - An issue is that you also have to install [ActivityWatch](https://github.com/ActivityWatch/activitywatch) which cannot be installed via Flatpak at least for now
- [Portmaster](https://safing.io/portmaster/#download) "Portmaster is a free and open-source application that puts you back in charge over all your computer's network connections." - **Cross-Platform** - installation is currently complicated
    - [waiting on support via Flatpak and/or Snap](https://github.com/safing/portmaster/issues/518)
    - Installation is complicated for Arch at the moment more can be found [here](https://docs.safing.io/portmaster/install/linux#arch-linux)
    - [waiting on better support for Arch Linux](https://docs.safing.io/portmaster/install/linux#arch-linux)
- System Monitors (GPU, system)
    - [Nvidia System Monitor](https://github.com/congard/nvidia-system-monitor-qt) "Task Manager for Linux for Nvidia graphics cards"
        - Installed using flatpak `flatpak install flathub io.github.congard.qnvsm`
    - [GreenWithEnvy](https://gitlab.com/leinardi/gwe) "System utility designed to provide information, control the fans and overclock your NVIDIA card"
        - Installed using flatpak `flatpak install flathub com.leinardi.gwe`
- [obs-StreamFX](https://github.com/Xaymar/obs-StreamFX)
- File explorers
    - [Spacedrive](https://github.com/spacedriveapp/spacedrive) - Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust. - **Cross-Platform**
    - [Xplorer](https://github.com/kimlimjustin/xplorer) - Xplorer, a customizable, modern file manager - Cross-Platform
- Graph GUI Stuff
    - SciLab, AlphaPlot or labplot all on flatpak
- RSS readers
    - [Communique](https://github.com/Suzie97/Communique) - "Featureful RSS Reader for elementary OS" cross-platform sync too - Linux - `flatpak install flathub com.github.suzie97.communique`

## Software Under Evaluation

- [Electron wrapper for Microsoft Office 365](https://github.com/matvelloso/electron-office) - An unofficial cross platform (including Linux) Electron client for Office Web - Cross-Platform - Takes a ton of memory

## Software I Don't Think I'll Ever Use Again

- [Sioyek](https://github.com/ahrm/sioyek) "Sioyek is a PDF viewer designed for reading research papers and technical books." - Cross-Platform - Installed using flatpak `flatpak install flathub com.github.ahrm.sioyek`
    - although capable learning the keyboard shortcuts would take quite a bit of effort and there is no way to use a mouse at all in the program
- [Kuro](https://github.com/davidsmorais/kuro) "An elegant Microsoft ToDo desktop client for Linux (a fork of Ao)" - Linux - Installation from AUR `yay -S kuro` can also use Flatpak
    - It works pretty well but I've preferred using WebCatalog for this, there were a few weird bugs when setting due dates and dark mode that I noticed
- [Biscuit](https://eatbiscuit.com/) Biscuit is a browser where you can organize your apps
    - no outlook working notifications there were some other issues overall it isn't bad may be worth another look in the future
- [Logseq](https://logseq.com/) - knowledge base that works on top of local plain-text Markdown - Cross-Platform - `flatpak install flathub com.logseq.Logseq`
    - although this seems to be really good I prefer using VSCode for all of my note taking so I have gravitated towards [Foam](https://foambubble.github.io/) they do have an Android App though
