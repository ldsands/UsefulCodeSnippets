# Bash Shell

Bash is a command shell for unix systems and is the most popular shell used in Linux systems.

## Resources

- [Wikipedia - Good overview](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)

## Useful Bash/zsh Concepts

- to get to different drives that are mounted you can use the code below. Just replace driveLetter with the drive letter you want to use.
    - Note that WSL automatically mounts external drives

    ```sh
    # navigate to the drive letter you want to move to
    cd /mnt/d
    ```

## Useful Bash/zsh Commands

- restart your bash shell (or if you have zsh use the second line)

    ```sh
    exec bash -l
    exec zsh -l
    ```

### WSL Setup

To set up WSL follow the instructions I've set [up here](windows_program_instructions/windows_programs.md/#wsl-windows-subsystem-for-linux).

Now to get bash all set up with useful features do the following steps:

1. install zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default) or [here for WSL specifically](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903)
1. install Oh My Zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

```bash
# get into administrator mode
sudo
# install git
sudo apt install git
# setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
git config --global core.autocrlf input
# set up git to use your account (optional)
git config --global user.name "Prename Name"
git config --global user.email "email@example.com"
# install zsh
sudo apt install zsh
# test to see if zsh is installed
zsh --version
# start zsh and select the 

# create settings file
touch ~/.zshrc
# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# set the theme for Oh My Zsh
ZSH_THEME="agnoster"
# get directory themes
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
# set the directory colors to the theme just downloaded
eval `dircolors ~/.dircolors`


```
