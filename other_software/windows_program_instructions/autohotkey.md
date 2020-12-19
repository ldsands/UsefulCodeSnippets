# AutoHotKey

AutoHotKey is a program that compiles scripts to automate various tasks in Windows it is VERY powerful but a bit hard to get going. There are however many different scripts that have been made over the years that are very well done.

## Resources

- [AutoHotKey](https://www.autohotkey.com/)
- [Documentation with tutorials](https://www.autohotkey.com/docs/AutoHotkey.htm)

## Installation

I use [chocolatey](chocolatey.md) to install AutoHotKey
you can also [download it](https://www.autohotkey.com/) from the main page and install manually

## Use your scripts

- First you have to [compile your script](#compile-your-script)
- Put your compiled scripts into the startup folder
    - You can get to the startup folder by pressing `Windows Key` + `R` then type in the following "shell:common startup"

### Compile your script

- To compile your script you need to use the command line. These instructions were taken from [this site](https://www.autohotkey.com/docs/Scripts.htm#ahk2exe)
    - If you installed AutoHotKey using chocolatey then you should be able to right click on the script and an option in the context menu should say "compile script"
    - Command Line: The compiler can be run from the command line with the following parameters:

    ```AutoHotKey
    Ahk2Exe.exe /in MyScript.ahk [/out MyScript.exe] [/icon MyIcon.ico] [/bin AutoHotkeySC.bin] [/mpress 0or1]
    Ahk2Exe.exe /in "MyScript.ahk" /icon "MyIcon.ico"
    ```

    - Parameters containing spaces should be enclosed in double quotes.
    - If the "out" file is omitted, the EXE will have the same base filename as the script itself.
- To compile multiple scripts you have to go through all of your scripts and make sure to comment out all of the `#Include` commands and then add them to your "master script." See below for an example:

    ```AutoHotKey
    #Include C:\Users\%A_UserName%\OneDrive\Computer stuff\WindowsStuff\autohotkey\doublecmdrAHK\win_e.ahk
    ```

## Example

I prefer to doublecommander to Windows Explorer for file management I did get used to the shortcut of `Windows Key` + `E` to bring up Explorer below is the code from AutoHotKey that intercepts this hotkey and launches doublecommander instead, I then assign `Windows Key` + `Alt` + `E` to the normal Windows Explorer because I still need to access it on occasion

- The #e means `Windows Key` + `E`
- The :: means do this
- In this case the `run` command is after the do this marker
- I put the location of the program I want it to run
- I put the compiled version of this program into the startup folder and it now works perfectly

```AutoHotKey
#e::run "C:\Users\%A_UserName%\OneDrive\Computer stuff\WindowsStuff\PortableApps\doublecmd-0.9.8.x86_64-win64\doublecmd.exe - Shortcut.lnk"
#!e::run "C:\Windows\explorer.exe - Shortcut.lnk"
```

## Some Good Scripts to Look Into

- [AutoHotKey script for Windows that lets a user change virtual desktops](https://github.com/pmb6tz/windows-desktop-switcher)
    - Don't forget to put the dll that comes with this repo into the startup folder if you want to the use move window command
    - I use this one a ton but I did change the keyboard shortcuts for two commands. Here is what I changed/enabled in the user_config.ahk script everything else was not used:

```AutoHotKey
CapsLock & Numpad1::switchDesktopByNumber(1)
CapsLock & Numpad2::switchDesktopByNumber(2)
CapsLock & Numpad3::switchDesktopByNumber(3)
CapsLock & Numpad4::switchDesktopByNumber(4)
CapsLock & Numpad5::switchDesktopByNumber(5)
CapsLock & Numpad6::switchDesktopByNumber(6)
CapsLock & Numpad7::switchDesktopByNumber(7)
CapsLock & Numpad8::switchDesktopByNumber(8)
CapsLock & Numpad9::switchDesktopByNumber(9)

CapsLock & 1::MoveCurrentWindowToDesktop(1)
CapsLock & 2::MoveCurrentWindowToDesktop(2)
CapsLock & 3::MoveCurrentWindowToDesktop(3)
CapsLock & 4::MoveCurrentWindowToDesktop(4)
CapsLock & 5::MoveCurrentWindowToDesktop(5)
CapsLock & 6::MoveCurrentWindowToDesktop(6)
CapsLock & 7::MoveCurrentWindowToDesktop(7)
CapsLock & 8::MoveCurrentWindowToDesktop(8)
CapsLock & 9::MoveCurrentWindowToDesktop(9)

CapsLock & tab::switchDesktopToLastOpened()
```
