# Linux Programs

- [Linux Programs](#linux-programs)
    - [Manjaro/Arch Based Distros](#manjaroarch-based-distros)
        - [Wine (On Manjaro)](#wine-on-manjaro)
        - [Waydroid (Android on Linux)](#waydroid-android-on-linux)
    - [Email applications](#email-applications)
        - [Random Apps for Manjaro](#random-apps-for-manjaro)
        - [Nativefier](#nativefier)
    - [Ubuntu/Debian Based Distros](#ubuntudebian-based-distros)
        - [Command Line Programs (On Ubuntu)](#command-line-programs-on-ubuntu)
        - [OBS Extensions (On Ubuntu)](#obs-extensions-on-ubuntu)
    - [Other Useful Applications (Distro Agnostic)](#other-useful-applications-distro-agnostic)
        - [Distro Agnostic Command Line Applications](#distro-agnostic-command-line-applications)

## Manjaro/Arch Based Distros

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
<!-- this will only work for Balabolka not TextAloud install `SpeechPlatformRuntime.msi` and `MSSpeech_TTS_en-GB_Hazel.msi` and/or `MSSpeech_TTS_en-US_ZiraPro.msi` -->

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

### Distro Agnostic Command Line Applications

- [NVTOP](https://github.com/Syllo/nvtop) "Nvtop stands for Neat Videocard TOP, a (h)top like task monitor for AMD and NVIDIA GPUs."
    - To install using yay `yay -S nvtop`
