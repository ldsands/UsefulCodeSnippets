# Bash/Zsh Shell

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

- sed is a stream editor that you can use to edit text files quickly and easily from the command line. Here are a couple of resources to get started [short and sweet](https://www.maketecheasier.com/what-is-sed/) and a much more [comprehensive guide](https://www.grymoire.com/Unix/Sed.html#uh-53). There are several examples under the [WSL Setup section](#wsl-setup) of this document.

## Useful Bash/zsh Commands

- restart your bash or zsh shell
    - or it seem like you can just type in the other shell and then do the other shell again and it'll restart your shell, so if you start in zsh and want to restart it you can type in `bash` then type in `zsh` and that seems to restart the `zsh` shell

    ```sh
    exec "$SHELL"
    ```

- To see all of the files in a directory you can use `ls` however if you also want to see the hidden files you need to use `ls -a`

### WSL Setup

To set up WSL follow the instructions I've set [up here](windows_program_instructions/windows_programs.md/#wsl-windows-subsystem-for-linux).

Now to get bash all set up with useful features do the following steps:

1. install zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default) or [here for WSL specifically](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903)
1. install Oh My Zsh
    - see detailed instructions [here](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

- Other sources I used while doing this
    - [link 1](https://www.sitepoint.com/zsh-tips-tricks/) [link 2](https://pascalnaber.wordpress.com/2019/10/05have-a-great-looking-terminal-and-a-more-effective-shell-with-oh-my-zsh-on-wsl-2-using-windows/) [link 3](https://nickymeuleman.netlify.app/blog/linux-on-windows-wsl2-zsh-docker#zsh) [link 4](https://www.sitepoint.com/zsh-tips-tricks/).
- for a list of pre-installed plugins look [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview)
- the theme I like to use is called [Powerlevel10k](https://github.com/romkatv/powerlevel10k#powerlevel10k) it is very powerful and customizable. Instructions for my set up are included below.

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
sudo apt install zsh -y
# test to see if zsh is installed
zsh --version
# start zsh and select the option with the default settings
zsh
# setup the default settings
2
# make it your default shell (you'll need to enter your password)
chsh -s $(which zsh)
# logout of the shell and restart it
exec "$SHELL"
# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Customizing the shell
# this allows you to open the configuration file with vs code
code ~/.zshrc
# set the theme for Oh My Zsh the agnoster option is already installed the powerlevel10k has to be downloaded and installed
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc
# change the blue to be easier to read
sed -i '0,/blue/{s/blue/39d/}' ~/.oh-my-zsh/themes/agnoster.zsh-theme
# enable auto correction (you also need to enable the plugin which is below)
sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# enable syntax highlighting (you also need to enable the plugin which is below)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# get directory themes
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
# set the directory colors to the theme just downloaded you need to add it to the .zshrc file copy all 3 of the next lines and enter them
sed -i -e '$a\
# load dircolors\
eval `dircolors ~/.dircolors`' ~/.zshrc
# this stops a "Insecure completion-dependent directories detected" if you need it use the code below without the first `#`
# sed -i '/plugins=(git)/a ZSH_DISABLE_COMPFIX=true' ~/.zshrc
# install pyenv and put into the PATH
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
# you also need these for using pyenv
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
# install poetry for python management
sudo apt-get install python-is-python3
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.zshrc
echo 'if [[ -z "$VIRTUAL_ENV" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi' >> ~/.zshrc
mkdir $ZSH/plugins/poetry
poetry completions zsh > $ZSH/plugins/poetry/_poetry
sudo apt-get install python3-venv -y
# add plugins - python related (python, pip) - zsh related (zsh-autosuggestions)
sed -i 's/plugins=(git)/plugins=(\n)/g' ~/.zshrc
sed -i '/^plugins=(/a \    git\n    python\n    pip\n    poetry\n    z\n    command-not-found\n    zsh_reload\n    zsh-autosuggestions\n    zsh-syntax-highlighting' ~/.zshrc
# restart the shell
exec "$SHELL"

```
