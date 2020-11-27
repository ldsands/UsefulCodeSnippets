#!/bin/bash

echo "This script will install and configure zsh and PowerShell for Ubuntu 20.04 running on Windows using WSL2"

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

PS3="Do you want to update everyting?"
ResponseOptions=("Yes" "No" "Quit")
select SelectedOption in "${ResponseOptions[@]}"; do
    case $SelectedOption in
        "Yes")
            echo "Updating everything"
            sudo apt-get update && sudo apt-get upgrade -y
            break
            ;;
        "No")
            echo "Nothing was updated"
            break
            ;;
        "Quit")
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

# PS3="Do you need to install basic programs? If yes then the script will install git, snap, PowerShell and zsh (with ohmyzsh)"
PS3="Do you need to install basic programs? If yes then the script will install git, PowerShell and zsh (with ohmyzsh)"
ResponseOptions=("Yes" "No" "Quit")
select SelectedOption in "${ResponseOptions[@]}"; do
    case $SelectedOption in
        "Yes")
            echo "Installing Git"
            echo "COMMAND could not be found"
            sudo apt-get update && sudo apt install git && git config --global core.autocrlf input
            echo "To finish configureing Git your git user name and email are needed"
            echo "please enter your git user name e.g. Prename Name"
            read GitUserName
            echo "please enter your git email e.g. email@example.com"
            read GitUserEmail
            git config --global user.name $GitUserName
            git config --global user.email $GitUserEmail
            if ! command -v pwsh
            then
                echo "Installing PowerShell"
                Version=$(lsb_release -r -s)
                # Update the list of packages
                sudo apt-get update
                # Install pre-requisite packages.
                sudo apt-get install -y wget apt-transport-https
                # Download the Microsoft repository GPG keys
                wget -q https://packages.microsoft.com/config/ubuntu/$Version/packages-microsoft-prod.deb
                # Register the Microsoft repository GPG keys
                sudo dpkg -i packages-microsoft-prod.deb
                # Update the list of products
                sudo apt-get update
                # Enable the "universe" repositories
                sudo add-apt-repository universe
                # Install PowerShell
                sudo apt-get install -y powershell
            else
                echo "PowerShell has already been installed"
            fi
            if ! command -v zsh --version
            then
                echo "Installing ZSH and ohmyzsh"
                sudo apt install zsh -y
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && n
            else
                echo "ZSH has already been installed"
            fi
            break
            ;;
        "No")
            echo "Nothing has been installed"
            break
            ;;
        "Quit")
            echo "User requested exit"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3="Which shell do you want as your default?"
ResponseOptions=("Bash" "PowerShell" "ZSH" "Leave as is" "Quit")
select SelectedOption in "${ResponseOptions[@]}"; do
    case $SelectedOption in
        "Bash")
            echo "Bash will be the default shell"
            chsh -s $(which bash)
            break
            ;;
        "PowerShell")
            # echo "PowerShell will be the default shell"
            printf "Unfortunatly at the moment there is an issue when trying to set PowerShell as the default shell in WSL based distros"
            printf "If you are not using linux on WSL then you can use this command to set PowerShell as the default shell\nchsh -s $(which pwsh)"
            # chsh -s $(which pwsh)
            break
            ;;
        "ZSH")
            echo "ZSH will be the default shell"
            chsh -s $(which zsh)
            break
            ;;
        "Leave as is")
            echo "Default shell has not been changed"
            ;;
        "Quit")
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3="Do you want to configure your shells?"
ResponseOptions=("PowerShell" "ZSH" "Don't Configure" "Quit")
select SelectedOption in "${ResponseOptions[@]}"; do
    case $SelectedOption in
        "PowerShell")
            echo "Configuring PowerShell"
            echo "TODO: This still has to be set up"
            break
            ;;
        "ZSH")
            echo "Configuring ZSH"
            echo "TODO: this still has to be set up"
            break
            ;;
        "Don't Configure")
            echo "Default shell has not been changed"
            break
            ;;
        "Quit")
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3="Do you want to install Python management packages?"
ResponseOptions=("Yes" "No" "Quit")
select SelectedOption in "${ResponseOptions[@]}"; do
    case $SelectedOption in
        "Yes")
            echo "Install pyenv, poetry, conda"
            echo "TODO: This still has to be set up"
            break
            ;;
        "No")
            echo "Configuring ZSH"
            echo "TODO: this still has to be set up"
            break
            ;;
        "Quit")
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

exit
