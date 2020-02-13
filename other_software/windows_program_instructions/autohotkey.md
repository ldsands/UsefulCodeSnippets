# AutoHotKey

AutoHotKey is a program that compiles scripts to automate various tasks in Windows it is VERY powerful but a bit hard to get going

## Resources

- [AutoHotKey](https://www.autohotkey.com/)
- [Documentation with tutorials](https://www.autohotkey.com/docs/AutoHotkey.htm)

## Setup

I use [chocolatey](chocolatey.md) to install AutoHotKey
you can also [download it](https://www.autohotkey.com/) from the main page and install manually

## Use your scripts

- First you have to compile your script
- put your compiled scripts into the startup folder
    - you can get to the startup folder by pressing `Windows Key` + `R` then type in the following "shell:common startup"

## Example

I prefer to doublecommander to Windows Explorer for file management I did get used to the shortcut of `Windows Key` + `E` to bring up Explorer below is the code from AutoHotKey that intercepts this hotkey and launches doublecommander instead

- the #e means `Windows Key` + `E`
- the :: means do this
- in this case the `run` command is after the do this marker
- I put the location of the program I want it to run
- I put the compiled version of this program into the startup folder and it now works perfectly

```AutoHotKey
#e::run "C:\Users\ldsan\OneDrive\Computer stuff\WindowsStuff\PortableApps\doublecmd-0.9.8.x86_64-win64\doublecmd.exe - Shortcut.lnk"
```
