# Nushell

[Nushell](https://www.nushell.sh/) is a shell that is written in rust and cross-platform.

- [Nushell](#nushell)
    - [Installing Nushell](#installing-nushell)
    - [Other Rust and Newshell Related Command Line Applications](#other-rust-and-newshell-related-command-line-applications)
    - [Useful Nushell Notes](#useful-nushell-notes)

## Installing Nushell

You can find the official documentation for installation [here](https://www.nushell.sh/book/installation.html).

- If you have rust and cargo installed you can install Nushell using the command below. This is the method I would recommend due to the consistency cross-platform.

```sh
# install rust ([using rustup](https://www.rust-lang.org/tools/install))
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# update rust using rustup
rustup update

# [install cargo-update which makes updating cargo packages/applications easier](https://crates.io/crates/cargo-update)
cargo install cargo-update
# check for all newer versions of cargo installed packages/applications (also self updates cargo install-update when applicable)
cargo install-update -a

# to see all cargo installed packages/applications such as Nushell Bottom or Typst you can use the command below
cargo install --list

# install Nushell using cargo (this is the same command you can use to update Nushell)
cargo install nu --locked

# for debian based systems you may need to install the packages below
sudo apt install pkg-config libssl-dev
# you may need to install a c compiler WSL Ubuntu doesn't come with one (do this if you see an error saying "error: linker `cc` not found")
sudo apt install build-essential
# for Fedora you may need the dependencies below
sudo dnf install openssl-devel -y
sudo dnf install cmake clang make gcc -y

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

- I then like to customize my Newshell with various options
    - I store these in a gist [found here](https://gist.github.com/ldsands/d3eac90b0b9d2b8613e165cc9e49d4f3)
    - Paste this code into the file that opens with the command here: `code $nu.config-path`

## Other Rust and Newshell Related Command Line Applications

- Rust/Cargo Command Line Applications
    - [Bottom](https://github.com/ClementTsang/bottom) - "[C]ross-platform graphical process/system monitor."
        - See below for a link to a gist that contains my preferred configuration options
        - use bottom by typing in `btm`
    - [Starship](https://starship.rs/) - "The minimal, blazing-fast, and infinitely customizable prompt for any shell!"
        - This requires a [Nerd Font](https://www.nerdfonts.com/) (or similar) to work properly here is a command that installs the Fira Code Nerd Font: `mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v`
        - See below for a link to a gist that contains my preferred configuration options
    - [Zoxide](https://github.com/ajeetdsouza/zoxide#installation) - "A smarter cd command."
        - This also uses (optionally) [fzf](https://github.com/junegunn/fzf) which is, "A command-line fuzzy finder"
    - [McFly](https://github.com/cantino/mcfly) - "McFly replaces your default `ctrl-r` shell history search with an intelligent search engine that takes into account your working directory and the context of recently executed commands."
    - [Yazi](https://yazi-rs.github.io/) - "Blazing fast terminal file manager written in Rust, based on async I/O."
- To connect to 3rd party extensions that help Nushell you will need to run the code below once before they'll work

```sh
# installation of bottom which is a system resource manager (required rust)
cargo install bottom
# create bottom and starship config files
mkdir -p ~/.config && mkdir -p ~/.config/bottom/
# copy my configuration from my gist to the bottom.toml file
cd ~/.config/bottom/ && wget ‐‐directory-prefix=~/.config/bottom/bottom.toml https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/bottom.toml -N

# to install starship via the recommended way
curl -sS https://starship.rs/install.sh | sh
# to uninstall starship if you used the recommended way
sh -c 'rm "$(command -v 'starship')"'

# to install starship via cargo
cargo install starship --locked
# if you install via cargo you need to change the location of the starship bin in this file `~/.cache/starship/init.nu` file from `^/usr/local/bin/starship` to here `^~/.cargo/bin/starship`
# to install the nerd fonts I use with starship and other programs
mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode-2407.24.zip" https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip && unzip CascadiaCode-2407.24.zip && sudo fc-cache -f -v
mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "CascadiaCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip && unzip CascadiaCode.zip && sudo fc-cache -f -v
mkdir -p ~/.local/share/fonts/nerd-fonts && cd ~/.local/share/fonts/nerd-fonts && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip && unzip FiraCode.zip && sudo fc-cache -f -v
# copy my configuration from my gist to the starship.toml file
cd ~/.config/ && wget ‐‐directory-prefix=~/.config/starship.toml https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/starship.toml -N

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
# for fedora you can install via dnf (using copr) instead
cargo install --locked yazi-fm yazi-cli
cargo install yazi-fm --locked
cargo install yazi-cli --locked
```

- To allow for Yazi to change the working directory go to [this link](https://yazi-rs.github.io/docs/quick-start#shell-wrapper) and copy the code into `config.nu`

```rust
def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}
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
