# Git

Git is a software management software that allows you to track changes made to files. A key benefit of this is the ability to keep all of your old versions of files without having to manage the storage and organization of those old versions. [Here](https://git-scm.com/) is the official website of git which also contains documentation.

## Setup

### Git global setup

Note: Just remove the `--global` flag for local setup

- This allows you to avoid having issues having to signing every time when using vscode to manage git/GitHub projects

```sh
git config --global user.name "Prename Name"
git config --global user.email "email@example.com"
```

- You should set the following options for the respective platforms to avoid issues

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

## Git Ignore Files

When you include a file in the parent directory of a project managed by git/GitHub you can enter some simple syntax that will not track any of the files or folders that you specify. You can find a lot of standard .gitignore files for different language projects at [this GitHub repo](https://github.com/github/gitignore). Below are a couple of examples:

```sh
# ignore all files in any folder with the extension .ogg
**/*.ogg
# this one is useful to add to Python projects
**/*.pyc
```

## Clean the git folder

- You can clean the git folder to reduce the size of the repository
- The old way of cleaning the git folder -  more information can be found [here](https://stackoverflow.com/a/2116892/8396684)
- The new way uses a command that is supposed to depreciate the `git gc` command more can be found [here](https://git-scm.com/docs/git-maintenance)

```sh
# old way of cleaning a repo
git reflog expire --all --expire=now
git gc --prune=now --aggressive
# the new way of doing it
git reflog expire --all --expire=now
git maintenance run --task=gc
```

## Removing Unwanted Files From Git History

You may need or want to remove files from a repo that has accidentally been committed. The cases usually cited are for large files or files that contain private/sensitive information. I had accidentally committed a bunch of audio files one time in a repo I had made. I wanted to remove these from the git history because they were taking up a ton of space. I found out about [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) which removes files based on some criteria. The instructions on the BFG Repo-Cleaner website are pretty good you should really follow them. Below are the steps I took to do this (more just to remember please use the instructions on [this site](https://rtyley.github.io/bfg-repo-cleaner/)).

- Preparatory steps:
    - Make sure you have Java installed and in your PATH
    - Put the repo git files (mirror command below) and the jar file in the same directory
    - You need to either rename the jar file to just `bfg.jar` or in the command examples below make sure to use the actual filename of the jar file (which will include the version number)

```PowerShell
# in a folder of choice copy the git files
git clone --mirror https://github.com/ldsands/UsefulCodeSnippets.git
# the command below removes all files that are larger than 100M
java -jar bfg.jar --strip-blobs-bigger-than 50M  my-repo.git
# the following command removes all of the file references that have an extension of .ogg from all git files
java -jar bfg.jar --delete-files '*.ogg'  UsefulCodeSnippets.git
# navigate into the git folder
cd UsefulCodeSnippets.git
# this physically removes the files from the folder
git reflog expire --expire=now --all
git gc --prune=now --aggressive
# push the updated git files to the server
git push
```
