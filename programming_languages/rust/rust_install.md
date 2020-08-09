# Rust Installation Instructions and Notes

## Installation of Rust, Cargo and Rustup

To install Rust on Windows go to [this link](https://www.rust-lang.org/tools/install) and download [this version of rustup](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe). You can also install this using chocolatey with `choco install rust` or winget with `winget install --id=Rust.rustup -e`.

For WSL use the command shown below to install Rust in your chosen distro and then follow the installation instructions. Afterwards you can check to see if it installed correctly by using: `rustc --version`. Note: using the ` exec "$SHELL"` will not work to see if the Rust components were added until you do a more complete restart of the shell. Any Linux distro installation should work the same commands shown below.

```sh
# download and run rustup to install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# check the rust and other rust components installation
rustc --version
cargo --version
rustup --version
# to update rust run the following:
rustup update
```

## Project and Environment Management

Instead of using environments like what is used in Python, Rust uses a local `Cargo.toml` file to dictate how the rust files in your project/package are run and with what packages.
