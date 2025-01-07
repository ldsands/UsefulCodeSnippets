# Nushell

[Nushell](https://www.nushell.sh/) is a shell that is written in rust and cross-platform.

- [Nushell](#nushell)
    - [Installing Nushell](#installing-nushell)
    - [Useful Nushell Notes](#useful-nushell-notes)

## Installing Nushell

You can find the official documentation for installation [here](https://www.nushell.sh/book/installation.html).

- If you have rust and cargo installed you can install Nushell using the command below. This is the method I would recommend due to the consistency cross-platform.

```sh
# install rust ([using rustup](https://www.rust-lang.org/tools/install))
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# update rust using rustup
rustup update
# install Nushell using cargo (this is the same command you can use to update Nushell)
cargo install nu --features=dataframe
# for debian based systems you may need to install the packages below
sudo apt install pkg-config libssl-dev
# you may need to install a c compiler WSL Ubuntu doesn't come with one (do this if you see an error saying "error: linker `cc` not found")
sudo apt install build-essential
# you will need to restart your shell
# you can now start Nushell with this command
nu
# once you start Nushell for the first time you can just press `y` twice to create the default Nushell config and env files
```

- I also like to copy the [Github repo nu_scripts](https://github.com/nushell/nu_scripts) into the directory `~/.config/` in order to access some of the useful scripts that others have created for Nushell. To do this use the code below
- You can then open the config file in VSCode using this command `code $nu.config-path`
    - I then use my personal Nushell config file gist to paste in my config file
        - Some of those instructions are below

```sh
# go to the `~/.config/` directory
cd ~/.config/
# use git to clone the repo 
git clone https://github.com/nushell/nu_scripts.git
# open the Nushell config file in VSCode
code $nu.config-path
```

- To connect to 3rd party extensions that help Nushell you will need to run the code below once before they'll work

```sh
# to install starship
curl -sS https://starship.rs/install.sh | sh
# for starship copy the 4 lines below to the $nu.env-path file
# for Nushell starting with starship
# comment out these lines if you see an error with showing "-c" as an "unknown flag" also remove the -c in the init.nu file
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

# for zoxide
# to install zoxide use cargo
rustup update
cargo install zoxide --locked
# if you need to install straight from the git (for an unreleased fix or feature) you can install it that way using the command below but you'll add some additional configurations to get it to work
cargo install zoxide --git https://ajeetdsouza/zoxide
# for zoxide copy the next three lines lines below to the $nu.env-path file
# for Nushell starting with zoxide
# zoxide init nushell | save ~/.zoxide.nu # only use the first time then comment out
source ~/.zoxide.nu

# for yazi
# to install yazi you can use cargo
cargo install --locked yazi-fm yazi-cli
```

- to update the 3rd party extensions shown above you can use the code below

```sh
# update starship
curl -sS https://starship.rs/install.sh | sh
# update zoxide
cargo install zoxide
```

- Setting aliases
    - Unfortunately due to the way that Nushell parses things you cannot set aliases conditionally so instead I just copy the corresponding os section to the bottom of the `config.nu` file. Here are the related GitHub Issues: [5068](https://github.com/nushell/nushell/issues/5068) [6048](https://github.com/nushell/nushell/issues/6048) [7203](https://github.com/nushell/nushell/issues/7203)

- There are many options to start Nushell automatically when starting a terminal.
    - One option is to add the `nu` command to whatever shell is the default (for example for bash put this in the `~/.bashrc` file). Shown below in the code block.
    - Another option is to use your terminal emulator to launch Nushell. Shown below is what I have done to make this happen with Kitty.
        - Note: this does seem to create some problems for loading some of the environment variables when they're loaded using other shell configuration files (such as adding python's poetry to the PATH environment variable via the `.bashrc` file). Due to this issue I don't use this option any more.
    - Another option is to directly change the default shell using the command `chsh -s $(which nu)`.
        - For some distros you'll need to add the nu to the file `/etc/shells`. You add the result of the command `which nu`.
            - If you installed Nushell using cargo it should be `/home/$USER/.cargo/bin/nu`
        - This changes the file `/etc/passwd`
        - To change it back to bash you can use this command `chsh -s $(which bash)` (you'll have to enter this command in bash).
        - Be aware that if you set Nushell as the default shell using this method it can mess with some of the environment variables that are set in `~/.bashrc`.
            - For example, poetry due to an interaction with pyenv will not load properly.

```sh
# using bash
# start Nushell automatically via bash in the `~/.bashrc` file
echo "Starting Nushell Automatically. To disable this comment out the line containing 'nu' in ~/.bashrc."
echo "To open ~/.bashrc in VSCode you can run \`bash_config\`"
nu
# using Kitty option
startup_session ~/.config/kitty/kitty-start.kitty
# create a `kitty-start.kitty` file here: `$HOME/.config/kitty/` you can use the command: `touch /$HOME/.config/kitty/`
# create a `kitty-start.kitty` file here: `$HOME/.config/kitty/` you can use the command: `touch /$HOME/.config/kitty/kitty-start.kitty`
# to start a shell as the default add one of the lines below with out the "# " characters
# launch nu
# launch xonsh
# launch bash
# launch zsh
```

## Useful Nushell Notes

- A list of all Nushell commands can be found [here](https://www.nushell.sh/book/command_reference.html).
- To save text to a file you can use the `save` command. To append rather than overwrite the text add the `-a` flag. An example is shown below.

    ```nu
    '
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
    ' | save -a ~/.bashrc
    ```
