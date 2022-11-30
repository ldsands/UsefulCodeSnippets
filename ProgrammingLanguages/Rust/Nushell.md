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
# install Nushell using cargo
cargo install nu --features=dataframe
# you will need to restart your shell
# you can now start Nushell with this command
nu
# once you start Nushell for the first time you can just press `y` twice to create the default Nushell config and env files
```

- I also like to copy the [Github repo nu_scripts](https://github.com/nushell/nu_scripts) into the directory `~/.config/` in order to access some of the useful scripts that others have created for Nushell. To do this use the code below
- You can then open the config file in VSCode using this command `code $nu.config-path`
    - I then use my personal Nushell config file gist to paste in my config file

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
rustup update
cargo install starship --locked
# for starship copy the 4 lines below to the $nu.env-path file
# for Nushell starting with starship
# comment out these lines if you see an error with showing "-c" as an "unknown flag" also remove the -c in the init.nu file
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

# for zoxide
# to install zoxide use cargo
rustup update
cargo install zoxide --locked
# for zoxide copy the next two lines lines below to the $nu.env-path file
# for Nushell starting with zoxide
zoxide init nushell | save ~/.zoxide.nu
```

- Setting aliases
    - Unfortunately due to the way that Nushell parses things you cannot set aliases conditionally so instead I just copy the corresponding os section to the bottom of the `config.nu` file. Here are the related GitHub Issues: [5068](https://github.com/nushell/nushell/issues/5068) [6048](https://github.com/nushell/nushell/issues/6048) [7203](https://github.com/nushell/nushell/issues/7203)

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
