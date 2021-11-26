# Linux Program

## Wine (On Manjaro)

- make sure wine and winetricks are installed via "Add/Remove Software" or via the command line: `yay -S wine winetricks`
    - In the example below I will setup a "bottle" for PDF X-Change Editor

    ```sh
    # create a location to put all of the "bottles"
    mkdir ~/Documents/wine && cd ~/Documents/wine
    # create a win64 bottle for a win64 applications with the prefix for the Windows environment (it seems like most name these by application due to different environment requirements)
    WINEARCH=win64 WINEPREFIX=~/wine/PDFXChangeBottle64 winetricks corefonts win10
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

    - To integrate the program with KDE you must create a `.desktop` file and put it here: `/home/ldsands/.local/share/applications/` with the contents below. Some of them have been customized for my use of PDF X-Change Editor
    - You also need to use `winetricks` then select the `winecfg` then select `Add Program` and find the `.exe` file you want to have access too in KDE
    - more info about the exec command can be found [here](https://askubuntu.com/questions/431684/how-can-i-find-the-progid-of-a-windows-program-to-use-in-wine)

    ```PDFXEdit9.desktop
    [Desktop Entry]
    Comment=The smallest, fastest, most feature-rich FREE PDF editor/viewer available! (Launched using Wine)
    Exec=env WINEPREFIX="/home/ldsands/wine/PDFXChangeBottle64/" WINEDEBUG=fixme-all wine "/home/ldsands/wine/PDFXChangeBottle64/drive_c/users/ldsands/Documents/pCloudLocal/PortableApps/PDFXEdit9_Portable/PDFXEdit.exe" Z:%f
    GenericName=PDF Editor
    Categories=Office;
    Icon=/home/ldsands/Documents/pCloudLocal/Pictures/NativefierIcons/PDFXEdit.png
    MimeType=application/pdf;
    Actions=new-empty-window;
    Keywords=PDF;
    Name=PDF X-Change Editor 9
    NoDisplay=true
    StartupNotify=false
    Terminal=false
    Type=Application
    ```

    - Another option is to use "Bottles" which can be installed from Flathub `flatpak install flathub com.usebottles.bottles -y`
        - I used the portable download of PDF X-Change Editor (version 9) for this example
        - I first run bottles after installation (it probably has to install some more software)
        - I create a directory to store everything I then copied the portable (extracted) directory of PDFXEdit9_Portable into the new `bottles` directory
        - I then select "Create a new bottle" button
            - For name I use `PDFXEdit9PortableBottle`
            - I select "Software" under "Environment"
            - I then press "Create"
        - Bottles will then create a new environment for the application. This will take a while.
        - Once the bottle creation is complete select the new bottle
            - 

## Command Line Programs (On Ubuntu)

- [OCRmyPDF](https://ocrmypdf.readthedocs.io/en/latest/index.html) - This a very good OCR command line utility.

    ```sh
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
    python -m venv venvKDE # for KDE Neon
    # activate the virtual environment
    source ./venvKDE/bin/activate # for KDE Neon
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

## OBS Extensions (On Ubuntu)

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
