# Manjaro KDE

Fedora is a Linux distro that is very stable but has more frequent updates than many other distros that are also very stable.

- [Manjaro KDE](#manjaro-kde)
    - [Installing Fedora KDE](#installing-fedora-kde)
    - [Installing Programs](#installing-programs)

## Installing Fedora KDE

I used the Fedora Media Writer on Windows to write Fedora KDE to a flash drive. I then just followed the instructions after booting into Fedora running on that flash drive.

## Installing Programs

- Install the following command line stuff and Microsoft Edge
    - [oh-my-zsh](https://ohmyz.sh/) - "Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration"
    - [znap](https://github.com/marlonrichert/zsh-snap) - "The fast & light-weight Zsh plugin manager"
    - [Git](https://git-scm.com) - "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
    - [Kitty](https://sw.kovidgoyal.net/kitty/) (my preferred terminal emulator)
    - [Microsoft Edge (beta)](https://www.microsoftedgeinsider.com/en-us/download/beta) (my preferred browser)

    ```sh
    # install git
    sudo dnf install git -y
    # setup git to not auto end filenames (can cause issues when opening a repo that has been opened on Windows)
    git config --global core.autocrlf input
    # set up git to use your account (optional)
    git config --global user.name "user_name"
    git config --global user.email "email@example.com"
    ```
