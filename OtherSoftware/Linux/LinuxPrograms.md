# Linux Programs

- [Linux Programs](#linux-programs)
    - [Arch Based Distros](#arch-based-distros)
        - [Wine (On Manjaro)](#wine-on-manjaro)
        - [Waydroid (Android on Linux)](#waydroid-android-on-linux)
        - [OBS Plugins](#obs-plugins)
    - [Email applications](#email-applications)
        - [Random Apps for Manjaro](#random-apps-for-manjaro)
        - [Nativefier](#nativefier)
    - [Ubuntu/Debian Based Distros](#ubuntudebian-based-distros)
        - [Command Line Programs (On Ubuntu)](#command-line-programs-on-ubuntu)
        - [OBS Extensions (On Ubuntu)](#obs-extensions-on-ubuntu)
    - [Other Useful Applications (Distro Agnostic)](#other-useful-applications-distro-agnostic)
        - [AppImage Applications](#appimage-applications)
        - [Bottles (For using Windows Applications)](#bottles-for-using-windows-applications)
        - [Distro Agnostic Command Line Applications](#distro-agnostic-command-line-applications)
        - [Flatpak Applications](#flatpak-applications)
        - [Nix Package Manager](#nix-package-manager)
        - [Other Distro Agnostic Applications](#other-distro-agnostic-applications)
        - [Rust Applications](#rust-applications)
        - [Snap](#snap)
    - [Linux (Distro Agnostic) Settings](#linux-distro-agnostic-settings)

## Arch Based Distros

- I use yay rather than pacman to install arch and AUR packages
    - A useful command that can tell you information about a package that is installed. For example it is useful if you want to know what it depends on or what depends on that package. `yay -Qi ceph-libs` In this example ceph-libs is the package name.
    - The `yay -Yc` command removes any unused programs installed via pacman/yay
    - To list every explicitly installed packages `yay -Qm`" [(taken from this reddit)](https://www.reddit.com/r/archlinux/comments/woh8fr/list_packages_installed_by_yay/?rdt=34147)
        - related `yay -Q` lists all that are installed via yay/pacman
        - `yay -Ps` gives some top level summary information about packages are installed
- For configuring Logitech Devices you can use [Solaar](https://pwr-solaar.github.io/Solaar/)
    - You should install this from extra on the Arch repository
    - There is a Flatpak application that appears to work but I cannot get it to recognize devices (I suspect some combination of Arch, bluetooth and Flatpak is causing the issue)
    - It also appears as thought the Flatpak of this packages is updated rarely

### Wine (On Manjaro)

- make sure wine and winetricks are installed via "Add/Remove Software" or via the command line: `yay -S wine winetricks`
    - In the example below I will setup a "bottle" for PDF X-Change Editor
    - FYI i'm still actively trying to figure out the best way to deal with this, it has proven to be very confusing and complicated.

    ```sh
    # create a location to put all of the "bottles"
    mkdir ~/Documents/wine && cd ~/Documents/wine
    # create a win64 bottle for a win64 applications with the prefix for the Windows environment (it seems like most name these by application due to different environment requirements)
    WINEARCH=win64 WINEPREFIX=~/wine/PDFXChangeBottle64 winetricks corefonts win10
    # to launch winetricks for this bottle
    WINEPREFIX=~/wine/PDFXChangeBottle64 winetricks
    # create a win32 bottle for a win32 applications with the prefix for the Windows environment dotnet40 (displays a lot of errors but the install works. Required for TextAloud 4 only) and speechsdk (sapi5) are ruquired to run TextAloud 4
    WINEARCH=win32 WINEPREFIX=~/wine/TextAloud4_32 winetricks corefonts speechsdk dotnet48 win10
    # the win32 WINEPREFIXs need this package for access to the internet (which allows activating TextAloud 4)
    yay -S lib32-gnutls
    # launch winetricks
    winetricks
    # launch winetricks with the non-default prefix
    WINEPREFIX=~/wine/TextAloud4_32 winetricks
    # winecfg allows you to access some other wine settings (such as which version of Windows to use)
    winecfg
    # to kill all wine processes use this command
    wineserver -k
    ```

<!-- TextAloud4 bottles stuff - useful links: https://askubuntu.com/a/1191253 - https://nextup.com/forum/viewtopic.php?f=13&t=6497 - https://appdb.winehq.org/objectManager.php?sClass=application&iId=1800 - https://www.microsoft.com/en-us/download/details.aspx?id=27224 - https://www.microsoft.com/en-us/download/details.aspx?id=27225 - -->
<!-- Bottles setup: use 32bit, use Caffe (newest version) -->
<!-- install dependencies .net48 msxml6 -->
<!-- install SpeechSDK51 (you need to unzip it then run `Microsoft Speech SDK 5.1.msi`) -->
<!-- install `SpeechSDK51LangPack.exe` (you need to unzip it then run `Microsoft Speech SDK 5.1 Language Pack.msi`) this should add a couple of voices -->
<!-- TODO: more sapi based instructions that may help can be found here: https://github.com/mjakal/sapi5_on_linux -->
<!-- install TextAloud4 (`ta4064.exe`) -->
<!-- this will only work for Balabolka not TextAloud, install `SpeechPlatformRuntime.msi` and `MSSpeech_TTS_en-GB_Hazel.msi` and/or `MSSpeech_TTS_en-US_ZiraPro.msi` -->

    - To integrate the program with KDE you must create a `.desktop` file and put it here: `/home/ldsands/.local/share/applications/` with the contents below. Some of them have been customized for my use of PDF X-Change Editor
    - You also need to use `winetricks` then select the `winecfg` then select `Add Program` and find the `.exe` file you want to have access too in KDE
    - more info about the exec command can be found [here](https://askubuntu.com/questions/431684/how-can-i-find-the-progid-of-a-windows-program-to-use-in-wine)

    ```PDFXEdit9.desktop
    [Desktop Entry]
    Comment=The smallest, fastest, most feature-rich FREE PDF editor/viewer available! (Launched using Wine)
    Exec=env WINEPREFIX="/home/ldsands/wine/PDFXChangeBottle64/" WINEDEBUG=fixme-all wine "/home/ldsands/wine/PDFXChangeBottle64/drive_c/users/ldsands/Documents/pCloudLocal/PortableApps/PDFXEdit9_Portable/PDFXEdit.exe" Z:%f
    GenericName=PDF Editor
    Categories=Office;
    Icon=/home/ldsands/Documents/pCloudLocalLevi/Pictures/NativefierIcons/PDFXEdit.png
    MimeType=application/pdf;
    Actions=new-empty-window;
    Keywords=PDF;
    Name=PDF X-Change Editor 9
    NoDisplay=true
    StartupNotify=false
    Terminal=false
    Type=Application
    ```

    - Another option is to use "[Bottles](https://usebottles.com/)" which can be installed from Flathub `flatpak install flathub com.usebottles.bottles -y` for increased sandboxing however I use the AUR package `yay -S bottles` mostly because it automatically allows access to the `bottles` command via the command line which allows for much easier creation of the `desktop` files needed for desktop integration of portable apps.
        - You can also use `appimage` it can access files outside of the bottle this allows me to launch the portable version of PDF X-Change Editor from my synced folder but creating a launch desktop file is more complicated
        - I used the portable download of PDF X-Change Editor (version 9) for this example
        - I first run bottles after installation (it probably has to install some more software)
        - I create a directory to store everything I then copied the portable (extracted) directory of PDFXEdit9_Portable into the new `bottles` directory
        - I then select "Create a new bottle" button
            - For name I use `PDFXEdit9PortableBot`
            - I select "Software" under "Environment"
            - I then press "Create"
        - Bottles will then create a new environment for the application. This will take a while.
        - Once the bottle creation is complete select the new bottle
        - You can add a `desktop` file to `/home/ldsands/.local/share/applications/` (I use the this filename: `PDFXEdit9.desktop`) and the content of this file is below

        ```PDFXEdit9.desktop
        [Desktop Entry]
        # Descriptions and Cosmetic Settings
        Name=PDF X-Change Editor 9
        GenericName=PDF Editor
        Keywords=PDF;pdf;
        Comment=The smallest, fastest, most feature-rich FREE PDF editor/viewer available! (Launched using Wine)
        Icon=/home/ldsands/Documents/pCloudLocal/Pictures/NativefierIcons/PDFXEdit.png
        # Other Settings and classifiers
        Exec=bottles -b PDFXEdit9PortableBot -e /home/ldsands/Documents/pCloudLocal/PortableApps/PDFXEdit9_Portable/PDFXEdit.exe
        Categories=Office;
        Type=Application
        MimeType=application/pdf;
        Actions=new-empty-window;
        NoDisplay=true
        StartupNotify=true
        Terminal=false
        X-KDE-Protocols=file
        ```

### Waydroid (Android on Linux)

NOTE: I have not updated this in a long time and I'm not sure it is worth it

- [Waydroid](https://waydro.id/) allows for using an android emulator and thus the apps in Linux.
- Installation is a bit involved the steps I took are below

```sh
# install linux-zen which includes some required additions to the kernel needed to run Waydroid
yay -S linux-zen-versioned-bin
# restart the computer
# install waydroid from AUR
yay -S waydroid waydroid-image
# install pyclip so that waydroid can access the clipboard
yay -S python-pyclip
# check if the waydroid container is enabled
systemctl is-enabled waydroid-container.service
# start the waydroid container
systemctl start waydroid-container.service
# "this will automatically download the latest Android image if it is not yet available"
sudo waydroid init
# start waydroid session 
waydroid session start
# start the android gui
waydroid show-full-ui
# to install an apk
waydroid app install $path_to_apk
waydroid app install Amazon_App.apk
# list installed apps
waydroid app list
# Run an application:
waydroid app launch $package-name
waydroid app launch com.amazon.venezia

# alternative way of installing waydroid
# taken from https://github.com/casualsnek/waydroid_script
yay -S lzip sqlite
git clone https://github.com/casualsnek/waydroid_script
cd waydroid_script
sudo python -m pip install -r requirements.txt
sudo python waydroid_extras.py [-i/-g/-n/-h]
sudo python waydroid_extras.py -g
sudo systemctl start waydroid-container.service
waydroid show-full-ui
# now wait until it has fully booted you may need to restart the computer
# then run the following line:
sudo python3 waydroid_extras.py -i
# you will then need to follow the instructions to register the device
# it may take 10-20 minutes
# then clear Google Play Service's cache by searching for "google play" in settings
# try logging in to the google account

```

### OBS Plugins

- [OBS-BackgroundRemoval](https://github.com/royshil/obs-backgroundremoval)
- [obs-StreamFX](https://github.com/Xaymar/obs-StreamFX)
    - Need to install the [NVIDIA Broadcast Video Effects](https://www.nvidia.com/en-us/geforce/broadcasting/broadcast-sdk/resources/) which as of 2022-07-12 is only available for Windows
        - An alternate download location that has more available platforms can be found [here](https://developer.nvidia.com/maxine-getting-started#video-effects-sdk) as of 2022-07-12 only has the Distros Ubuntu and CentOS specifically support
        - [The Github repo can be found here](https://github.com/NVIDIA/MAXINE-VFX-SDK)
        - [Here is the documentation for Linux](https://docs.nvidia.com/deeplearning/maxine/vfx-sdk-system-guide/index.html#vfx-sdk-system-guide-linux-intro) I might be able to figure out how to use the software despite the Ubuntu or CentOS system requirement <!-- TODO: Figure this out -->

## Email applications

I've tried several of them and I have issues with all of them. I may as well leave useful instructions for setting up email applications here.

- [Thunderbird](https://www.thunderbird.net/en-US/)
    - I install this (and Birdtray) using flatpak.
    - I really like Thunderbird overall. My biggest issues are first that you cannot minimize to the try and still get notifications (though there is a way to help with this, see below). The other issue is that you have to pay for a plugin to use EWS email accounts (see more below).
    - To get minimize to tray download and install [Birdtray](https://github.com/gyunaev/birdtray/).
    - I use [Owl](https://www.beonex.com/owl/) to access EWS email accounts. You are prompted to install the plugin during account setup.
- [Evolution](https://wiki.gnome.org/Apps/Evolution)
    - I install this using flatpak.
    - Although setup is pretty easy and it uses less RAM than others I cannot control shutting down the background processes when I need the extra RAM. Also there is very little customization.
    - Using EWS also syncs calendar items and contacts. This works for both my University account as well as my personal outlook account.
        - To set it up for an Office365 account (using EWS you can use IMAP but EWS is "better") is a bit of a pain.
        - For "Host URL:" enter [https://outlook.office365.com/EWS/Exchange.asmx](https://outlook.office365.com/EWS/Exchange.asmx)
- [Kmail](https://apps.kde.org/kmail2/)
    - I install this using flatpak (install the pakage called Kontact).
    - This is my favorite client but I cannot control shutting down the background processes when I need the extra RAM.
    - To set it up for an Office365 account (using EWS you can use IMAP but EWS is "better") is a bit of a pain. Fortunately there is a great tutorial on [YouTube](https://www.youtube.com/watch?v=j-dkD92r3FE).
        - Under the "EWS Settings" section you'll need to enter this site: "[https://outlook.office365.com/EWS/Exchange.asmx](https://outlook.office365.com/EWS/Exchange.asmx)"

### Random Apps for Manjaro

- For more battery settings which can help with battery life I download for use on laptops `yay -S slimbookbattery`
    - My experience with Manjaro (and linux more generally) has shown me that by default Windows is much better for battery life. To fix this I use the standard settings for Slimbook Battery 4 and select battery saving. This has helped a lot with battery drain.
- [Piper](https://github.com/libratbag/piper/wiki) for managing my Logitech mouse peripherals
    - `yay -S piper`
- [Orange: Interactive data analysis](https://github.com/biolab/orange3) is a data analysis package/collection of packages that allows for visual programming with some predefined modules
    - Add-ons add to the functionality of Orange. Official add-ons can be found [here](https://github.com/biolab/orange3/blob/stable/README.md).
    - One way is to install from AUR:
        - `yay -S python-orange`
    - The developers recommend using conda.

        ```sh
        conda config --add channels conda-forge
        conda config --set channel_priority strict
        conda install orange3
        ```

    - I've had success using pyenv venv and pip and this fits into my workflow much better

        ```sh
        # if you have pyenv installed
        pyenv install 3.9.7
        pyenv global 3.9.7
        # to check the selected version
        pyenv versions
        # create a virtual environment
        python -m venv .venv
        # activate the virtual environment
        source ./.venv/bin/activate
        # upgrade pip
        python -m pip install --upgrade pip
        # install wheel package so that installations go quicker
        pip install wheel
        # use pip install to install Orange Canvas
        pip install orange3
        # install add-ons that I commonly use
        pip install Orange3-Text
        # run Orange Canvas
        python -m Orange.canvas
        ```

    - To run the Orange Canvas (the GUI) use this command: `python -m Orange.canvas`
- [OCRmyPDF](https://ocrmypdf.readthedocs.io/en/latest/index.html) - This a very good OCR command line utility.

    ```sh
    # install OCRmyPDF and tesseract-english FYI the tesseract will take a long time to install
    yay -S ocrmypdf tesseract-data-eng-git
    # some example usage commands
    ocrmypdf --force-ocr --pdf-renderer sandwich --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-sandwich.pdf"
    ocrmypdf --force-ocr --optimize 3 --jbig2-lossy --pdf-renderer sandwich --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-sandwich-jbig2.pdf"
    ocrmypdf --force-ocr --pdf-renderer hocr --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-hocr.pdf"
    ocrmypdf --force-ocr --optimize 3 --jbig2-lossy --pdf-renderer hocr --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-hocr-jbig2.pdf"
    ```

- [Kile](https://kile.sourceforge.io/) for LaTeX (also available for [Windows](https://www.microsoft.com/en-us/p/kile/9pmbng78pfk3))

### Nativefier

Nativefier is an electron wrapper that can turn any website into a desktop application. It is very useful for obvious reasons. To install nativefier enter the following code after you have installed node.js:

```sh
# install node.js using yay be sure to select the one that says "community/nodejs"
sudo pacman -S nodejs npm
# test install
node -v
# to install nativefier using npm
sudo npm install -g nativefier
# to update nativefier (you must have admin privileges) you should update npm first then update nativefier (the command below updates npm and then nativefier)
sudo npm update -g npm && sudo npm update -g nativefier
# it is also a good idea to create a folder just for nativefier below is where I put it
mkdir /home/ldsands/Documents/NativefierApps/
# now navigate to the folder to create the nativefier program there
cd /home/ldsands/Documents/NativefierApps/
```

The options are all explained [here](https://github.com/nativefier/nativefier/blob/master/API.md).

- Some notable options
    - `--hide-window-frame` disables window frame and controls.
    - `--single-instance` you can only have one window of this open at a time
    - `--internal-urls ".*?"` if you want any domain to be able to work in the nativefier window
    - `--portable` "Make your app store its user data (cookies, cache, etc) inside the app folder"
    - `--conceal` this combines several files in the `resources` directory into one file (I've had issues with this saving login information)
    - `--maximize` this will maximize the window on launch
    - `--platform` `windows`, `linux` or `osx` (there is anther option for Mac)

Some Nativefier Limitations

- You cannot use `ctrl` + `f` to use find in page
- Although it seems like it is possible to block ads I haven't figured out how to do it yet.
    - One method that can work for some sites is to use the user agent option (e.g. `--user-agent 'Mozilla/5.0 (xxxxxx)`) more user agents can be found [here](https://user-agents.net/)

Below are a list of the nativefier apps that I install with their code.

```sh
# Outlook Personal
nativefier https://outlook.live.com/mail/ --name "Outlook Personal" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/microsoft-outlook-2019-240.png --browserwindow-options '{"webPreferences": { "webviewTag": true, "nodeIntegration": true, "nodeIntegrationInSubFrames": true } }'
# Outlook Personal Calendar
nativefier https://outlook.live.com/calendar/0/view/week --name "Outlook Personal Calendar" --internal-urls ".*(office|live|office365|sharepoint|microsoft|onenote)\.(com).*" --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/MicrosoftOutlookCalendarIcon.png --browserwindow-options '{"webPreferences": { "webviewTag": true, "nodeIntegration": true, "nodeIntegrationInSubFrames": true } }'
# Uiowa Outlook email
nativefier --name "Uiowa Outlook" "https://outlook.office365.com/mail/inbox" --internal-urls ".*(office|office365|officeonline|microsoftonline|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --counter --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.png --browserwindow-options '{"webPreferences": { "webviewTag": true, "nodeIntegration": true, "nodeIntegrationInSubFrames": true } }'
# Uiowa Outlook calendar
nativefier --name "Uiowa Outlook Calendar" "https://outlook.office.com/calendar/view/week" --internal-urls ".*(office|office365|officeonline|microsoftonline|sharepoint|microsoft|onenote|uiowa)\.(com|edu).*" --counter --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/Uiowa-Dome-favicon-96x96.png --browserwindow-options '{"webPreferences": { "webviewTag": true, "nodeIntegration": true, "nodeIntegrationInSubFrames": true } }'
# Microsoft To Do
nativefier --name "MS To Do" "https://to-do.live.com/tasks/planned" --internal-urls ".*(office|office365|sharepoint|microsoft|microsoftonline|onenote)\.(com).*" --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/MicrosoftToDoLogo.png --portable
# ProWritingAid editor site
nativefier --name "ProWritingAid" "https://prowritingaid.com/en/Analysis/Documents/Go" --internal-urls ".*prowritingaid.com.*" --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/ProWritingAid.png --portable
# ProWritingAid editor site going directly to a blank document for quick edits
nativefier --name "ProWritingAid" "https://app.prowritingaid.com/?id=rXW9R9pL8d" --internal-urls ".*prowritingaid.com.*" --icon /home/$USER/Documents/pCloudLocalLevi/Pictures/NativefierIcons/ProWritingAid.png --portable
```

- You will need to create a `.desktop` file (at least for KDE on Arch Linux). You can find user `.desktop` files here: `/home/$USER/.local/share/applications/` or for machine `.desktop` files here `/usr/share/applications/`. From these examples you can enhance the example `.desktop` file I made for Microsoft To Do below.

```MicrosoftToDo.desktop
[Desktop Entry]
Categories=Office;Nativefier;
Comment[en_US]=Microsoft To Do. To Do gives you focus, from work to play.
Comment=Microsoft To Do. To Do gives you focus, from work to play.
StartupWMClass=MSToDo
Exec=/home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo
GenericName[en_US]=MicrosoftToDo
GenericName=MicrosoftToDo
Icon=/home/ldsands/Documents/pCloudLocalLevi/Pictures/NativefierIcons/MicrosoftToDoLogo.png
MimeType=
Name[en_US]=Microsoft To Do
Name=Microsoft To Do
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
TryExec=/home/ldsands/Documents/NativefierApps/MSToDo-linux-x64/MSToDo
Type=Application
Version=1.0
X-DBUS-ServiceName=
X-DBUS-StartupType=
X-KDE-SubstituteUID=false
X-KDE-Username=
```

## Ubuntu/Debian Based Distros

### Command Line Programs (On Ubuntu)

- [OCRmyPDF](https://ocrmypdf.readthedocs.io/en/latest/index.html) - This a very good OCR command line utility.

    ```sh
    # for Debian based distros
    # install dependencies
    sudo apt-get -y update
    sudo apt-get -y install \
        ghostscript \
        icc-profiles-free \
        liblept5 \
        libxml2 \
        pngquant \
        python3-pip \
        tesseract-ocr \
        zlib1g
    # install ocr
    pip3 install OCRmyPDF
    # install JBIG2 which allows for much smaller pdf sizes
    sudo apt-get install -y autotools-dev automake libtool leptonica-progs libleptonica-dev
    cd ~/Downloads && git clone https://github.com/agl/jbig2enc
    cd jbig2enc
    ./autogen.sh
    ./configure && make
    sudo make install
    # some example usage commands
    ocrmypdf --force-ocr --pdf-renderer sandwich --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-sandwich.pdf"
    ocrmypdf --force-ocr --optimize 3 --jbig2-lossy --pdf-renderer sandwich --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-sandwich-jbig2.pdf"
    ocrmypdf --force-ocr --pdf-renderer hocr --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-hocr.pdf"
    ocrmypdf --force-ocr --optimize 3 --jbig2-lossy --pdf-renderer hocr --output-type pdf --deskew --clean "input.pdf" "output-OCR-deskew-clean-hocr-jbig2.pdf"
    ```

- [Mycroft Mimic](https://mycroft-ai.gitbook.io/docs/mycroft-technologies/mimic-overview) - It is a TTS program that is okay but not great I'll keep searching for a better one.

    ```sh
    # Create and enter a directory for Mimic
    cd ~/Documents && mkdir Mimic && cd Mimic
    # Install dependencies
    sudo apt-get install gcc make pkg-config automake libtool libicu-dev libpcre2-dev libasound2-dev
    # clone and enter repo
    git clone https://github.com/MycroftAI/mimic1.git && cd mimic1
    # Install ALSA which is an audio engine
    sudo apt-get install alsa-base
    # Build and install missing dependencies
    ./dependencies.sh --prefix="/usr/local"
    # Generate mimic build scripts
    ./autogen.sh
    # Configure
    ./configure --prefix="/usr/local"
    # Bulid
    make
    # Check
    make check
    # testing voices
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice ap
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice slt
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice slt_hts
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice kal
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice awb
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice kal16
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice rms
    ./mimic -t "Hello. Doctor. Name. Continue. Yesterday. Tomorrow." -voice awb_time
    ```

- [coqui-ai/TTS](https://tts.readthedocs.io/en/latest/inference.html)

    ```sh
    # Create and enter a directory for coqui-ai/TTS
    cd ~/Documents && mkdir coquiTTS && cd coquiTTS
    # create a virtual environment
    python -m venv .venvKDE # for KDE Neon
    # activate the virtual environment
    source ./.venvKDE/bin/activate # for KDE Neon
    python -m pip install --upgrade pip
    # install wheel package so that installations go quicker
    pip install wheel
    # for just using TTS functions you can install from PyPI
    pip install TTS
    # list all voices using the tts command
    tts --list_models
    # you can use your browser to create text using this command and then entering the address into the browser
    tts-server
    ```

### OBS Extensions (On Ubuntu)

Note: this is outdated use OBS via Flatpak as it now seems to work pretty much perfectly as of late 2024

- Install [OBS Studio](https://obsproject.com/) - `sudo apt-get install obs-studio`
    - Do not install using snap or flatpak

    ```sh
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt-get install -y \
        libc-dev-bin \
        libc6-dev git \
        build-essential \
        checkinstall \
        cmake \
        ffmpeg \
        v4l2loopback-dkms \ # this adds support for creating a virtual camera
        obs-studio \
        qtbase5-dev
    ```

- [OBS Plugin: Background Removal](https://github.com/royshil/obs-backgroundremoval) - This removes the background from the video in OBS

    ```sh
    cd ~/Downloads
    sudo apt install -y libopencv-dev language-pack-en wget git build-essential cmake
    # sudo apt install -y libobs-dev libopencv-dev language-pack-en wget git build-essential cmake
    wget https://github.com/microsoft/onnxruntime/releases/download/v1.7.0/onnxruntime-linux-x64-1.7.0.tgz
    sudo tar xzvf onnxruntime-linux-x64-1.7.0.tgz --strip-components=1 -C /usr/local/ --wildcards "*/include/*" "*/lib*/"
    # clone and enter the repo
    git clone https://github.com/royshil/obs-backgroundremoval.git
    cd obs-backgroundremoval
    # make and enter build directory
    mkdir build && cd build
    # compile the files needed for the plugin
    cmake .. && cmake --build . && sudo cmake --install .
    # add links because obs and the plugin are installed to different locations for older versions
    sudo ln -s /usr/local/lib/obs-plugins/obs-backgroundremoval.so /usr/lib/obs-plugins/
    sudo ln -s /usr/local/share/obs/obs-plugins/obs-backgroundremoval /usr/share/obs/obs-plugins/
    ```

## Other Useful Applications (Distro Agnostic)

This section consists of applications that are as far as I'm aware largely distro agnostic. Note that most of the applications detailed in both the Ubuntu and Arch sections are probably also distro agnostic but they may often have different installations instructions and/or configuration requirements depending on the distro. Also, many of the instructions below may not be consistently for Ubuntu (Debian based) or Manjaro (Arch based). I'll probably just use whatever installation instructions I used at the time I added the application to this document.

### AppImage Applications

- "Linux apps that run anywhere" [(AppImage Home Page)](https://appimage.org/). You can find a list of AppImage applications at [AppImageHub](https://www.appimagehub.com/).
    - Unfortunately AppImageHub is not very comprehensive but it is the best there is as far as I'm aware (as of 2024-12-16)
    - You can also use [AppImage Pool](https://flathub.org/apps/io.github.prateekmedia.appimagepool) that can be installed via Flatpak that accesses the AppImageHub database and can install AppImage applications
- AppImage applications don't always come with a `.desktop` file or at least don't place it where needed all the time
    - Now there is a flatpak application that can automates much of the AppImage management including creating `.desktop` files
        - [Gear Lever](https://github.com/mijorus/gearlever) - to install `flatpak install flathub it.mijorus.gearlever`
    - To help with this issue you can use [this repo](https://github.com/un1t/appimage-desktop-entry)
        - Download the file and use the instructions to extract and then create a `.desktop` file that can then be used to find the application in KDE
        - In the directory containing the file `appimage-desktop-entry.sh` use the example command below (make sure to use the correct ) to create the `.desktop` file and have it automatically moved to the correct location for KDE to see it
            - `bash ./appimage-desktop-entry.sh /home/$USER/Documents/AppImageApplications/LM_Studio-0.3.3.AppImage` (Note I did this in Nushell)

### Bottles (For using Windows Applications)

- [Bottles](https://usebottles.com) - "Easily run Windows software on Linux with Bottles!"
    - Note that on [2023-10-05 Bottles devs announced that they will be doing a major overhaul](https://usebottles.com/blog/bottles-next-a-new-chapter/) of bottles.
- I usually install this using Flatpak so that it is sandboxed
- To install the runners for the bottles:
    - Click on the hamburger menu in the upper right then select the "Runners" tab
        - I usually use the "Soda" runners as they are the preferred runners made by the Bottles devs
        - Click on the "Soda" button/dropdown
            - Click on the "🖫" (disk symbol) next to the latest version
- General Bottle Setup
    - Click on the "+" in the upper left
        - Name your bottle and I generally either select "Application" or "Custom" (I select the latest "Soda" runner)
- The Library tab
    - This allows you to put programs installed within bottles into one place and launch them from one location even if they're installed in different bottles
    - To add a program to the Library tab enter the bottle of the application you wish to add
        - Under "Programs" select the hamburger menu next to the application you wish to add then select "Add to Library"
- Desktop Entries
    - Adding a desktop entry allows for a program to be visible to the Linux Desktop Environment (e.g. KDE) so that you can for example search for the program in the application launcher, or pin a program to the taskbar
        - You'll need Flatseal to do this using these instructions
            - In Flatseal select Bottles then find the "Other Files" box
                - Click on the button on the right side
                - In the textbox that appears enter "/var/home/$USER/.local/share/applications"
        - You can also use this command in the terminal instead of using Flatseal: `flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications`
    - Under "Programs" select the hamburger menu next to the application you wish to add then select "Add Desktop Entry"
- Applications that I install in Bottles
    - Bottle notes for [Balabolka](http://balabolka.site/balabolka.htm)
        - Under "Options", click on "Dependencies"
            - Click on the "🖫" (disk symbol) next to "dotnet481"
            - Click on the "🖫" (disk symbol) next to "msxml6" (not sure if this is needed but it was recommend on WineHQ)
            - Click the back button in the upper left to return to the main bottle page once the installation of dependencies are completed
        - Click on the blue "Run Executable..." button (the order does matter here)
            - First it tis not absolutely needed but it is a good idea to move all the files you need into the bottle "drive"
                - Click on the three dots button in the upper right then click on "Browse Files..."
                - Copy the `SpeechPlatformRuntime.msi` and `MSSpeech_TTS_en-GB_Hazel.msi` files into the opened "drive"
                    - I put then in a new directory called `InstallationFiles`
            - Install the Microsoft Speech Platform with the `SpeechPlatformRuntime.msi` file ([found here](https://www.microsoft.com/en-us/download/details.aspx?id=27225))
                - Follow the installation instructions
                - It is a good idea to reboot the bottle after this by clicking on the power symbol "⏻" then clicking on "Reboot"
            - Install a Microsoft Speech Platform voice for example using the file `MSSpeech_TTS_en-GB_Hazel.msi` ([found here](https://www.microsoft.com/en-us/download/details.aspx?id=27224))
                - Follow the installation instructions
                - It is a good idea to reboot the bottle after this by clicking on the power symbol "⏻" then clicking on "Reboot"
            - Install Balabolka
                - You can just use the portable version by copying the files for the portable version into the bottle (as mentioned above)
                    - If I use the portable version of Balabolka then I also create a directory called `PortableApps` I then copy the contents extracted from `balabolka_portable.zip` into the new directory
                    - Under "Programs" click on "Add Shortcuts..."
                        - Navigate to the `PortableApps/Balabolka` directory you created and copied earlier then select `balabolka.exe`
                - If you use the non-portable version of Balabolka then you should copy over the contents from the downloaded `balabolka.zip` file into the `InstallationFiles` directory mentioned above
                    - Click on the "Run Executable..." button navigate to `InstallationFiles/balabolka` and click on `setup.exe`
                    - Follow the installation instructions
                    - The `balabolka.exe` file should automatically be added to the "Programs" section
        - To refresh the program list installed in the bottle click the back button in the upper left then click on the bottle name to reenter the main bottle page
            - There should now be two entries under "Programs"
        - Launch Balabolka (by clicking on the play symbol on the same line as "balabolka")
    - Bottle notes for [PDFXEdit]
        - I usually name these bottles in this format: PDFXEdit-Purpose-Soda-7.0-8
            - "Purpose" is domain which I use it for
                - For example, I usually have one called "Random" for whatever random PDF I may open and work on. I also usually have one for any research projects that I'm actively writing so that I don't have to worry about losing an open set of PDFs, or mixing with other projects so that there are too many PDFs open at one time.
            - If you want you can leave off the version of soda you used to create the bottle since you can update the runner used the bottle if you do the following
                - Under "Options", click on "Settings", then under "Components" click on the box labeled "Runner"
        - Under "Options", click on "Settings"
            - Under "Compatibility" click on "Windows Version"
                - Select Windows 11
            - Under "Display" click on "Advanced Display Settings"
                - Disable "Window Manager Decorations" (this removes the bar at the top of the window that Linux/KDE puts there when the program is maximized)
        - Under "Options", click on "Dependencies"
            - Click on the "🖫" (disk symbol) next to "allfonts"
        - I used the portable download of PDF X-Change Editor (version 9) for this example
        - When running PDF-XChange Editor in Bottles on Linux the program will freeze after a while. To deal with this I usually "Force Stop Process" on the process called "PDFXEdit.exe". Doing this seems to work better than trying to stop any other bottle related process.
        - Other notes:
            - Some notes that are useful from the [Wine website](https://appdb.winehq.org/objectManager.php?sClass=application&iId=15599)
            - On [the PDF-XChange forums there is some discussion](https://forum.pdf-xchange.com/viewtopic.php?p=187062&hilit=wine#p187062) of the application freezing after a while which is something I also experience
                - [PDF-XChange forums on crashing issues](https://forum.pdf-xchange.com/viewtopic.php?p=171650&hilit=wine#p171650)

### Distro Agnostic Command Line Applications

- [NVTOP](https://github.com/Syllo/nvtop) "Nvtop stands for Neat Videocard TOP, a (h)top like task monitor for AMD and NVIDIA GPUs."
    - To install using yay `yay -S nvtop`
- [Auto CPU-Freq](https://github.com/AdnanHodzic/auto-cpufreq) - for saving battery life on laptops
    - At time of writing you cannot install this using aur without issues instead you should use the installer with the code shown below:

    ```sh
    # clone the repo enter the dir then start the installer
    git clone https://github.com/AdnanHodzic/auto-cpufreq.git
    cd auto-cpufreq && sudo ./auto-cpufreq-installer
    # you must install the daemon for it to boot with the system
    sudo auto-cpufreq --install
    # to see stats use this command
    auto-cpufreq --stats
    ```

### Flatpak Applications

Flatpak allows for applications to "be easily installed on any Linux distribution" [(Flathub Website)](https://flathub.org/home). I use many application installed via Flatpak because they are so easy to install and use and they are highly sandboxed more so than both Snap and AppImage.

- To uninstall any Flatpak app use uninstall instead of install such as seen here: `flatpak uninstall flathub org.inkscape.Inkscape -y`
- To clean up unused flakpak applications and dependencies: `flatpak uninstall --unused`

- AppImage Pool - A simple, modern AppImageHub Client.
    - Installation command `flatpak install flathub io.github.prateekmedia.appimagepool -y`
- Caprine - Elegant Facebook Messenger desktop app
    - Installation command `flatpak install flathub com.sindresorhus.Caprine`
    - Not verified but it is linked on the official GitHub repo of the app
- Chromium Web Browser - The web browser from Chromium project
    - Installation command `flatpak install flathub org.chromium.Chromium -y`
- Discord - Messaging, Voice, and Video Client
    - Installation command `flatpak install flathub com.discordapp.Discord -y`
- [Easy Effects](https://github.com/wwmm/easyeffects) - "Limiter, compressor, convolver, equalizer and auto volume and many other plugins for PipeWire applications"
    - Installation command `flatpak install flathub org.gnome.Evolution -y`
    - To get a loudness equalization effect you can use [this site](https://www.frackstudio.com/xeq/tips-tricks-xeq-ten-bands/) go to the heading labeled "5. Limiter" for a good explanation. I've created some instructions to implement this using Easy Effects below
        - Manual instructions to get loudness equalization
            - To get a loudness equalization effect you can go to the "Output" tab then "Add Effect" then select "Compressor"
            - I leave everything at default (for now I haven't had a chance to do much testing as of 2023-12-03)
        - Some presets you can download and apply:
            - You need to put the `.json` files here (for flatpack installation) `~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output`
            - [Has several different loudness equalization presets](https://github.com/Digitalone1/EasyEffects-Presets)
                - I think I like the crystallization version a bit better
            - [Has a preset with both loudness equalization and some auto gain (based on the work of the repo above)](https://github.com/JackHack96/EasyEffects-Presets)
- Evolution - Manage your email, contacts and schedule
    - I haven't used this one in a while, I think Thunderbird is probably the better option as of 2023-11-27
    - Installation command `flatpak install flathub org.gnome.Evolution -y`
- Flatseal - "Manage Flatpak permissions"
    - Installation command `flatpak install flathub com.github.tchx84.Flatseal`
- [Gabut Download Manager](https://flathub.org/apps/details/com.github.gabutakut.gabutdm) - "Simple and Faster Download Manager"
    - `flatpak install flathub com.github.gabutakut.gabutdm`
- [Gear Lever](https://github.com/mijorus/gearlever) - "Manage AppImages with ease" can create `.desktop` files and can help with updates for some AppImage applications
    - `flatpak install flathub it.mijorus.gearlever`
- Inkscape - Vector Graphics Editor
    - Krita is probably better but this one is a bit more simple for better and for worse
    - Installation command `flatpak install flathub org.inkscape.Inkscape -y`
- Krita
    - Installation command `flatpak install flathub org.kde.krita -y`
- LibreOffice - Office Applications lots of features for an almost perfect replacement for MS Office
    - Installation command `flatpak install flathub org.libreoffice.LibreOffice -y`
    - To use LanguageTool in LibreOffice you need to use their API ([instructions can be found at this link](https://languagetool.org/insights/post/product-libreoffice/#how-to-enable-languagetool-on-libreoffice))
    - I like to change some of the settings
        - From "View" select "User Interface"
            - Select "Tabbed"
        - There is an issue with fonts in some flatpak applications (I think only GTK based applications) being very blocky (the antialiasing doesn't work right)
            - As of 2025-06-05 I no longer think this is an issue at least on EndeavourOS
            - [some details can be found here](https://github.com/flatpak/flatpak/issues/2861)
            - To fix this for Arch Distros you must install a gtk package. Use this command `yay -S xdg-desktop-portal-gtk`
            - Another fix for this is to use Flatseal select LibreOffice then deselect "Wayland windowing system" (sub-label is "socket=wayland")
- OBS Studio - "Live streaming and video recording software"
    - Installation command `flatpak install flathub com.obsproject.Studio`
        - I used XSHM for screen capture to work (pipewire is the other option but it must require something more to work)
        - You must make sure that "v4l2loopback" is installed to use the virtual camera feature
    - [OBS Background Removal](https://github.com/occ-ai/obs-backgroundremoval) - "An OBS plugin for removing background in portrait images (video), making it easy to replace the background when recording or streaming."
        - Installation command `flatpak install flathub com.obsproject.Studio.Plugin.BackgroundRemoval`
- Okular - Lightweight pdf viewer
    - Installation command `flatpak install flathub org.kde.okular`
- ONLYOFFICE - Office Applications I like it better than LibreOffice for slides and word documents
    - Installation command `flatpak install flathub org.onlyoffice.desktopeditors`
    - There is an issue that in ONLYOFFICE Spreadsheet when using the "Filter" feature it can mess up the rows particularly with functions so I use LibreOffice for spreadsheet work
- PeaZip - Free file archiver utility, open, extract RAR TAR ZIP archives
    - Installation command `flatpak install flathub io.github.peazip.PeaZip -y`
- [Piper](https://github.com/libratbag/piper/wiki) - "Gaming mouse configuration utility" (for managing my Logitech mouse peripherals in Linux)
    - Installation command `flatpak install flathub org.freedesktop.Piper -y`
    - As of 2023-11-29 they have not had an official release since 0.7 which was was in 2022-06 this means that the flakpak version is outdated
        - probably should install this using the git e.g. use AUR (`yay -S piper-git`) or [build it](https://github.com/libratbag/piper/wiki/Installation#building-from-source)
- [Speech Note](https://github.com/mkiol/dsnote) - "Notes with offline Speech to Text, Text to Speech and Machine Translation"
    - Installation command `flatpak install flathub net.mkiol.SpeechNote`
    - Works pretty well even without a GPU
        - some good voices (in order of preference)
            - English British (Piper Alba Medium Female) / en
            - English British (Piper Jenny Medium Female) / en
            - English British (Piper Cori High Female) / en
- SpeedCrunch - A high-precision scientific calculator
    - Installation command `flatpak install flathub org.speedcrunch.SpeedCrunch -y`
- Spotify - Online music streaming service
    - Installation command `flatpak install flathub com.spotify.Client -y`
- System Monitors (GPU, System)
    - [Mission Center](https://missioncenter.io/) - Monitor system resource usage
        - Installation command `flatpak install flathub io.missioncenter.MissionCenter`
    - [GreenWithEnvy](https://gitlab.com/leinardi/gwe) - System utility designed to provide information, control the fans and overclock your NVIDIA card
        - Installation command `flatpak install flathub com.leinardi.gwe`
        - Be aware that this does not seem to launch correctly when pinned to the taskbar in Manjaro KDE
    - [Nvidia System Monitor](https://github.com/congard/nvidia-system-monitor-qt) "Task Manager for Linux for Nvidia graphics cards"
        - Installation command `flatpak install flathub io.github.congard.qnvsm`
    - [CoreStats](https://gitlab.com/cubocore/coreapps/corestats) "A system resource viewer for C Suite." Very simple but still useful
        - Installation command `flatpak install flathub org.cubocore.CoreStats`
    - No longer supported - System Monitoring Center - Multi-featured system monitor
        - Installation command `flatpak install flathub io.github.hakandundar34coding.system-monitoring-center`
- TextSnatcher - Snatch Text with just a Drag
    - Installation command `flatpak install flathub com.github.rajsolai.textsnatcher`
- Thunderbird - Email
    - Installation command `flatpak install flathub org.mozilla.Thunderbird`
- Teams for Linux
    - Installation command `flatpak install flathub com.github.IsmaelMartinez.teams_for_linux`
- Telegram Desktop messenger
    - Installation command `flatpak install flathub org.telegram.desktop -y`
- Todoist: To-Do List & Tasks "The best to-do list app right now" - The Verge
    - Installation command `flatpak install flathub com.todoist.Todoist -y`
- Warehouse - A gui for managing installed flatpak applications (particularly good for removing leftover data)
    - Installation command `https://flathub.org/apps/io.github.flattool.Warehouse`
- [Weather](https://invent.kde.org/plasma-mobile/kweather) - View real-time weather forecasts and other information
    - Installation command `flatpak install flathub org.kde.kweather`
- [Zoom](https://flathub.org/apps/details/us.zoom.Zoom) - "Video Conferencing, Web Conferencing, Webinars, Screen Sharing"
    - Installation command `flatpak install flathub us.zoom.Zoom`
    - Some settings using Flatseal would be useful for staying logged in and keeping configurations. [A blog that talks about this can be found here](https://www.mayrhofer.eu.org/post/zoom-flatpak-sandboxing/).
- Zotero - Collect, organize, cite, and share research
    - Installation command `flatpak install flathub org.zotero.Zotero -y`

### Nix Package Manager

NOTE: I haven't ever gotten around to really figuring this out maybe I'll pick it up in the future

- Nix is a package manager that is distro agnostic and has a lot of advantages over other package managers. They also have their own distro called NixOS.

```sh
# install NixOS package manager (this will install it for multi-users which is recommended)
sh <(curl -L https://nixos.org/nix/install) --daemon
# install NixOS package manager (this will install it for a single user)
sh <(curl -L https://nixos.org/nix/install) --no-daemon
# [to update nix (on linux)](https://nixos.org/manual/nix/stable/installation/upgrading.html)
nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert; systemctl daemon-reload; systemctl restart nix-daemon
```

- To get installation commands you can go to the [Nix Packages Search site](https://search.nixos.org/packages) and search for packages you want to install. Make sure you use the `nix-env` and make sure you use `nixpkgs` unless you're on NixOS.
    - For KDE if you want the applications you install via Nix to be visible to KDE, you will also need to like the location of the .desktop files to the "normal" location of the .desktop files. It can be done this command `cp -L ~/.nix-profile/share/applications/* ~/.local/share/applications/`
    - The documentation for `nix-env` can be found [here](https://nixos.org/manual/nix/stable/command-ref/nix-env.html). Apparently the nix-env is the older way to use nix packages.

```sh
# example install Telegram Desktop
nix-env -iA nixpkgs.tdesktop
# To install packages that contain non-free software you'll need to add the line below to this file: ~/.config/nixpkgs/config.nix
{ allowUnfree = true; }
# to allow KDE to see the .desktop files you'll need to use the command below (you may need to use sudo)
cp -L ~/.nix-profile/share/applications/* ~/.local/share/applications/
# to uninstall you must complete two commands, first uninstall
nix-env --uninstall telegram.desktop
# then use garbage collection to remove the files
nix-collect-garbage
# to upgrade all installed nix packages:
nix-env -u
# to show what would be upgraded (but don't actually upgrade)
nix-env -u --dry-run
```

### Other Distro Agnostic Applications

- [Ventoy](https://www.ventoy.net/en/index.html) - "Ventoy is an open source tool to create bootable USB drive for ISO/WIM/IMG/VHD(x)/EFI files." You can also install it on Windows.
- [fprint](https://fprint.freedesktop.org/) - "The fprint project aims to add support for consumer fingerprint reader devices, in Linux, as well as other free Unices."
    - [A list of supported devices can be found here.](https://fprint.freedesktop.org/supported-devices.html) To see if your device is supported you can use the command `lsusb` and then use that information to see if your device is on the supported list.
    - To install you can use [this page](https://forum.kde.org/viewtopic.php?t=175570) as a guide for Ubuntu based distros. For Arch based distros you can go [here](https://wiki.archlinux.org/title/Fprint) and then [here for the Fingerprint GUI.](https://wiki.archlinux.org/title/Fingerprint_GUI)
- [Free Download Manager](https://www.freedownloadmanager.org/) - "It's a powerful modern download accelerator and organizer for Windows, macOS, Android, and Linux."
    - via yay `yay -Syu freedownloadmanager`
- [Crontab (cron guru for creating cron jobs)](https://crontab.guru)
    - For running commands on Linux on a schedule
    - Good resource for this can be found at [crontab.guru](https://crontab.guru)
    - Some commands that are useful [from this site](https://www.cyberciti.biz/faq/howto-linux-unix-start-restart-cron/)
        - Status command `sudo service cron status` or `systemctl status cron`
    - To make sure that cron starts on boot (for Ubuntu) from this useful article on [Ubuntu startup services](https://www.slingacademy.com/article/ubuntu-how-to-auto-start-service-on-system-boot/)
        - To enable cron on boot `sudo systemctl enable cron`
        - To check to see if cron is enabled on boot `sudo systemctl is-enabled cron`
    - To use this with running a uv environment for python you can do the following `00 09 * * * /home/ldsands/TeslaTakedown/.venv/bin/python3 /home/ldsands/TeslaTakedown/0001_scrape_html_file.py >/dev/null 2>&1` ([more about this is in a UV issue here](https://github.com/astral-sh/uv/issues/11991))
        - In the issue linked above they said that this command should work but I couldn't get it to work `uv run --project /root/my_project /root/my_project/task.py` it possibly broke in an update
        - the `>/dev/null 2>&1` at the end to not send an email I think this was causing issues but that may have been because of this error message: "No MTA installed, discarding output" installing an MTA might have solved it (could use this probably but I haven't tested it `sudo apt-get install postfix`)
        - can see log of crontab using this command: `grep -i cron /var/log/syslog`
        - Don't forget to check the timezone of the computer
            - can check the timezone with this command: `timedatectl`
            - can see possible timezones with this command: `timedatectl list-timezones | grep America`
            - can set the timezone to central with this command: `sudo timedatectl set-timezone America/Chicago`
- [Systemd Services and Timers](https://wiki.archlinux.org/title/Systemd/Timers) - alternative to cron that is much newer and easier to debug and overall thought of as being better than cron
    - put a file into this directory `/etc/systemd/system/`
    - The time formatting is different [this article helps explain how to use it correctly and compares it to cronjob's formatting](https://silentlad.com/systemd-timers-oncalendar-(cron)-format-explained)
    - Useful commands:
        - `systemctl list-timers --all # list all running services`
    - Example below using uv to run a python script

```sh
# create the TeslaTakedown.service file
touch /etc/systemd/system/TeslaTakedown.service
# add the needed content to the TeslaTakedown.service file
echo '
[Unit]
Description=Run TeslaTakedown Python Script
After=multi-user.target

[Service]
Type=simple
ExecStart=/home/ldsands/TeslaTakedown/.venv/bin/python3 /home/ldsands/TeslaTakedown/0001_scrape_html_file_selenium.py

[Install]
WantedBy=multi-user.target
' >> /etc/systemd/system/TeslaTakedown.service

# create the TeslaTakedown.timer file
touch /etc/systemd/system/TeslaTakedown.timer
# add the needed content to the TeslaTakedown.timer file
echo '
[Unit]
Description=Run the TeslaTakedown python script daily at 9AM

[Timer]
OnCalendar=*-*-* 9:00:00 America/Chicago
Persistent=true

[Install]
WantedBy=timers.target
' >> /etc/systemd/system/TeslaTakedown.timer
# note that "Persistent=true" means that if it misses a run then it'll do it on boot

# enable the service and the timer
sudo systemctl enable TeslaTakedown.service
sudo systemctl enable TeslaTakedown.timer
# if you modify any of the files you should restart the service/timer
sudo systemctl restart TeslaTakedown.service
sudo systemctl restart TeslaTakedown.timer
# after editing the files you should run the command below to reload th daemon
systemctl daemon-reload
# to get the status of the files/services/timers
systemctl status TeslaTakedown.service
systemctl status TeslaTakedown.timer
# to manually start/run a service
systemctl --user start TeslaTakedown.service
```

### Rust Applications

- There are many Rust based applications that are distro agnostic and often cross-platform as well
- Note that most of my notes on Rust based applications are located in the [file devoted to Nushell](../../ProgrammingLanguages/Rust/Nushell.md)
- [Edit](https://github.com/microsoft/edit) - "A simple editor for simple needs."
    - for usage you can use the command `ms-edit <filename>`
    - For Arch based distros: `yay -S ms-edit`
    - You can [download the binary](https://github.com/microsoft/edit/releases) and use that or you can build it
    - To download it:
        - Download the latest release ([example url:](https://github.com/microsoft/edit/releases/download/v1.2.0/edit-1.2.0-x86_64-linux-gnu.tar.zst))
            - Example command downloading using curl along with decompressing and extracting the tarbell file:
                - `wget -O edit-1.2.0-x86_64-linux-gnu.tar.zst "https://github.com/microsoft/edit/releases/download/v1.2.0/edit-1.2.0-x86_64-linux-gnu.tar.zst" && tar --zstd -xvf edit-1.2.0-x86_64-linux-gnu.tar.zst && rm edit-1.2.0-x86_64-linux-gnu.tar.zst`
    - To build it
        - Make sure rust is installed
        - clone the repo `git clone https://github.com/microsoft/edit.git` (as of 2025-06-17 there is no crates.io entry and it doesn't look like they want to support that method of installation)
        - Build the repo `cargo build --config .cargo/release.toml --release`

### Snap

- Snap is very similar to flatpak but has some advantages and disadvantages below are some advantages of both platforms
    - Snap is slower to startup, officially supported by Canonical (a company that also manages Ubuntu), it can be used on linux servers and even IoT devices, it generally takes up less storage space than flatpak packages, slightly better security (on average), easier to build and maintain packages
    - Flatpak does not require admin privileges, complexly open source, broader distribution and distro support
    - Some packages are better supported on Snap and some on Flatpak sometimes it just depends
- [Snapcraft](https://snapcraft.io/) - The store for snap packages
- To install snap on Arch Linux
    - `yay -S snapd` - to install snapd
    - `sudo systemctl enable --now snapd.socket` - to allow systemd manage snap communication
    - `sudo systemctl enable --now snapd.apparmor.service` - "If AppArmor is enabled in your system, enable the service which loads AppArmor profiles for snaps"
    - probably should reboot after this
- Other useful Snap commands
    - `snap refresh --list` list snap packages that need to be updated
    - `sudo snap refresh` to update snap packages
- Snap packages I use/install usually only because they have better support on Snap over Flatpak
    - [Vivaldi](https://snapcraft.io/vivaldi) - One of my favorite browsers
        - `sudo snap install vivaldi`

## Linux (Distro Agnostic) Settings

- Swap Partitions
    - Swap partitions are a temporary RAM storage that is put onto a harddrive it is usually used as an emergency overload in case memory gets overloaded.
    - Unfortunately, for some reason when I run some python scripts the swap partition gets overloaded even though the RAM is largely unused. So to help with this I have placed some commands below to disable and enable swap. I used the article [How to Disable Swap in Linux](https://linuxhandbook.com/disable-swap-linux/) as a reference.

    ```sh
    # show swap partitions and files
    swapon --show
    # disable a swap file or partition (you can get the path to the swap file/partition using the command above)
    sudo swapoff /dev/zram0
    # disable all active swap files/partitions
    sudo swapoff -a
    # enable all swap files/partitions
    sudo swapon -a
    # To delete the swap file/partitions
    sudo rm /dev/zram0
    ```
