# DGX OS

## General DGX OS Information and Resources

- "NVIDIA DGX OS provides a customized installation of Ubuntu Linux with system-specific optimizations and configurations, additional drivers, and diagnostic and monitoring tools." [From the "About DGX OS 7 / Ubuntu 24.04" page](https://docs.nvidia.com/dgx/dgx-os-7-user-guide/index.html)
- Due to the DGX Spark having an ARM 64 based SOC there are a lot of notes and instructions about how to deal with issues that have to do with running on ARM as opposed to amd64 or x86_64
- Useful Nvidia Docs links
    - [About DGX OS 7 / Ubuntu 24.04](https://docs.nvidia.com/dgx/dgx-os-7-user-guide/index.html)

## Installing DGX OS

TODO:

## Initial Setup Configuration Instructions

- Set up Git settings (so that there isn't any conflict with Windows)
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."

    ```sh
    # git should be preinstalled on DGX OS so you wont need to install it
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    git config --global credential.helper 'store --file ~/.my-credentials'
    # set up git to use your account (optional, make sure that you use the "{ID}+{username}@users.noreply.github.com" email format)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    # this makes it so you dont have to sign in every time you do anything with Github
    # if you still have issues you can look [here](https://stackoverflow.com/a/51097104) for some helpful tips
    # you will need to push (`git push`) a commit via terminal for this to work
    # you will need to enter your Github login and password (you must use a personal access token instead of your password)
    git config --global credential.helper 'store --file ~/.my-credentials'
    ```

## Installation Instructions

```sh
# install rofi (a launcher)
sudo apt install rofi
```
