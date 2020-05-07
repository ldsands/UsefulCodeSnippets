# Git

## Setup

### Git global setup

Note: Just remove the `--global` flag for local setup

- this allows you to avoid having issues having to signing every time when using vscode to manage git/github projects

```sh
git config --global user.name "Prename Name"
git config --global user.email "email@example.com"
```

- you should set the following options for the respective platforms to avoid issues

```sh
# for windows work that will also have work done on any unix system (or just to be on the safe side)
git config --global core.autocrlf true
# for Linux and MacOS
git config --global core.autocrlf input
```

- On Windows and Mac you should probably enable the following code so that you don't run into issues with filename case sensitivity

```sh
git config --global core.ignorecase false
```
