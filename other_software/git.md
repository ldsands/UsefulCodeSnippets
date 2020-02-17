# Git

## Setup

### Git global setup

Note: Just remove the `--global` flag for local setup

- this allows you to avoid having issues having to signing every time when using vscode to manage git/github projects

```git
git config --global user.name "Prename Name"
git config --global user.email "email@example.com"
```

- On Windows and Mac you should probably enable the following code so that you don't run into issues with filename case sensitivity

```git
git config --global core.ignorecase false
```
