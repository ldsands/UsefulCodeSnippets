# Linux Program

## Command Line Programs

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

## OBS Extensions

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

- [OBS Plugin: Background Removal] - This removes the background from the video in OBS

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
