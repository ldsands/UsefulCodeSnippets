# QMK Firmware

All of these instructions will be for Windows. More detailed instructions can be obtained [here](https://docs.qmk.fm/#/).

## Basic Setup

- Install the following programs
    - [MSYS](https://github.com/qmk/qmk_distro_msys/releases/latest): this is used to compile the the keyboard firmware
    - [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases): This is used to flash the firmware to the keyboard
- Setting up MSYS
    - Run MSYS and enter the command `qmk setup`
- To compile your the firmware you need this command:

    ```sh
    # this is the command to compile using a layout contained in the folder `ldsands`
    qmk compile -kb keebio/iris/rev4 -km ldsands
    ```
