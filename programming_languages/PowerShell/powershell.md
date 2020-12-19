# PowerShell and Cmd Prompt

Note that in almost every situation PowerShell is vastly superior to cmd prompt. Also, PowerShell core (or just PowerShell as of version 7) is cross platform and can be used and linux mac or windows

If you're planning on executing PowerShell scripts you will probably want to run the following (otherwise nothing will run):

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- [PowerShell and Cmd Prompt](#powershell-and-cmd-prompt)
    - [Installation](#installation)
        - [Using dotnet Sdk](#using-dotnet-sdk)
    - [Adding to Windows Path](#adding-to-windows-path)
    - [PowerShell profiles](#powershell-profiles)
    - [Useful commands](#useful-commands)
        - [PowerShell functions](#powershell-functions)
        - [Aliases](#aliases)
        - [Random Useful Commands](#random-useful-commands)
    - [Using PowerShell on Windows](#using-powershell-on-windows)
    - [Using PowerShell on MacOS](#using-powershell-on-macos)
    - [Using PowerShell on Linux](#using-powershell-on-linux)
    - [CMD](#cmd)
        - [doskey macros](#doskey-macros)

## Installation

### Using dotnet Sdk

You can install PowerShell using the dotnet sdk (core or standard) on any platform. However you will not be able to get context menu use with this method (for more details [see this section under my dotnet instructions](../programming_languages/dotnet/dotnet_install_overview.md#dotnet-tools))

## Adding to Windows Path

Adding items to path in PowerShell is kind of annoying becuase the commands are so verbose. Below is an example of adding python downloaded and installed from chocolatey to the Windows path.

```PowerShell
# set a new path that will be added to the path environment
$newPath = "C:\Users\%username%\AppData\Local\Programs\Python\Python38\Scripts;C:\Users\%username%\AppData\Local\Programs\Python\Python38"
# save the old path to a variable
C:\ProgramData\Boxstarter;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\ProgramData\chocolatey\bin;C:\Program Files\Git\cmd;C:\Program Files\PowerShell\7\;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Program Files\nodejs\;C:\Program Files\dotnet\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Microsoft VS Code\bin;C:\Program Files\Amazon\AWSCLI\;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\
$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
# add the new path to the path
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
# check the path to make sure it worked correctly
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
# an alternative way to check the path
$env:Path -split ';'
```

## PowerShell profiles

- To make functions and other settings persist across terminals, reboots and closing PowerShell run the following code
    - For linux just change the $PROFILE.CurrentUserAllHosts to $profile

```PowerShell
code $PROFILE.CurrentUserAllHosts
$ProfileTemplate = @"
function listProfileFunctions {
    `$profileFunctions = @("home", "admin", "ToArray", "checkAdmin", "GetOneCoreVoices", "GetInstalledVoices", "InstallAllModules", "WSLRestart", "UpdatePowerShell")
    Write-Host `$profileFunctions
}

# useful functions
## allows you to type home and change your directory to your home folder
function home {Set-Location -Path `$Home}
## allows you to type admin and start an administrator terminal
function admin {Start-Process PowerShell -Verb runAs}
## allows you to pipe output into an array
function ToArray
{
    begin
    {
        `$output = @();
    }
    process
    {
        `$output += `$_
    }
    end
    {
        return ,`$output
    }
}

function checkAdmin {
    if (`$IsWindows) {
        if (!(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
            Write-Host "You do not have Administrator rights to run this script"
        }
        else {
            Write-Warning "You have Administrator rights enabled"
        }
    }
    elseif (`$IsLinux) {
        if ((id -u) -eq 0) {
            Write-Warning "You have Administrator rights enabled"
        }
        else {
            Write-Host "You do not have Administrator rights to run this script"
        }
    }
}

function UpdatePowerShell {
    if (`$IsWindows) {
        if (!(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
            Write-Host "PowerShell will now be updated"
            iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
        }
        else {
            Write-Host "You do not have Administrator rights to run this script"
        }
    elseif (`$IsLinux) {
        if ((id -u) -eq 0) {
            Write-Warning "PowerShell will now run apt update and apt upgrade"
            sudo apt-get update && sudo apt-get upgrade -y
        }
        else {
            Write-Host "You do not have Administrator rights to run this script"
        }
}

## add autocomplete for dotnet commands
# PowerShell parameter completion shim for the dotnet CLI 
# Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    # param(`$commandName, `$wordToComplete, `$cursorPosition)
        # dotnet complete --position `$cursorPosition "`$wordToComplete" | ForEach-Object {
        #    [System.Management.Automation.CompletionResult]::new(`$_, `$_, 'ParameterValue', `$_)
        # }
# }

## activate OneCore Voices
function GetOneCoreVoices {
    `$desiredLanguages = @("en-US", "en-GB", "en-AU", "en-CA")
    `$languageList = Get-WinUserLanguageList
    `$languageListTag = `$languageList.LanguageTag | ToArray
    foreach (`$desiredLanguage in `$desiredLanguages) {
        if (`$desiredLanguage -notin `$languageListTag) {
            `$languageList.Add(`$desiredLanguage)
        }
    }
    1
    Set-WinUserLanguageList `$LanguageList
    `$sourcePath = 'HKLM:\software\Microsoft\Speech_OneCore\Voices\Tokens' #Where the OneCore voices live
    `$destinationPath = 'HKLM:\SOFTWARE\Microsoft\Speech\Voices\Tokens' #For 64-bit apps
    `$destinationPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens' #For 32-bit apps
    cd `$destinationPath
    `$listVoices = Get-ChildItem `$sourcePath
    foreach(`$voice in `$listVoices)
    {
    Write-Host "Making `$voice available to third party applications"
    `$source = `$voice.PSPath #Get the path of this voices key
    copy -Path `$source -Destination `$destinationPath -Recurse
    copy -Path `$source -Destination `$destinationPath2 -Recurse
    }
    Write-Host "The following languages are now installed:"
    GetInstalledVoices
}

## get installed voices
function GetInstalledVoices {
    Add-Type -AssemblyName System.speech
    `$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    `$speak.GetInstalledVoices() | foreach  { `$_.VoiceInfo.Name }
}

## set PSReadLine Options
# Install-Module -Name PSReadLine -AllowPrerelease -Force # for installing PSReadLine 2.2 beta the following won't work without it
Set-PSReadLineOption -PredictionSource HistoryAndPlugin  # allow for predictions from history to show
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[35;7;238m"} # 35 means purple

## starship config
`$ENV:STARSHIP_CONFIG = "`$HOME\.starship"

## navigate up easier (one level `up1` two levels `up2` three levels `up3` four levels `up4`)
function up1 { Set-Location ..\ }
function up2 { Set-Location ..\.. }
function up3 { Set-Location ..\..\.. }
function up4 { Set-Location ..\..\..\.. }

## Install the normal modules that I use just type InstallAllModules
function InstallAllModules() {
    `$requiredModules = @("PSReadLine", "posh-git","oh-my-posh", "Get-ChildItemColor", "Microsoft.PowerShell.RemotingTools")
    foreach (`$element in `$requiredModules) {
        if (-not (Get-Module -ListAvailable -Name `$element)) {
            Write-Host "Installing `$element"
            Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -ErrorAction SilentlyContinue
            Install-Module -Name `$element -AllowClobber -Scope AllUsers
        }
    }
}

# Import Modules (on Windows)
if(`$IsWindows) {
    Import-Module Microsoft.PowerShell.RemotingTools
    Import-Module posh-git
    # Import-Module oh-my-posh
    # Set-Theme Paradox
}

function WSLRestart() {
    if (`$IsWindows) {
        if (!(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
            Write-Host "You need administrator privilages to use WSLRestart"
        }
        else {
            Get-Service LxssManager | Restart-Service
        }
    }
}

# Start Starship as the prompt
Invoke-Expression (&starship init powershell)

# startup messages
checkAdmin
Write-Host "to get a list of custom functions type listProfileFunctions"
"@
Set-Content -Path $PROFILE.CurrentUserAllHosts -Value $ProfileTemplate
```

<!-- if (!(Test-Path -Path $PROFILE.AllUsersAllHosts)) {
    New-Item -ItemType File -Path $PROFILE -Force
} 
This will create the file if it doesn't exist yet but I don't think it is needed -->

## Useful commands

### PowerShell functions

PowerShell functions can be very powerful and do pretty much anything you can think of a good place to start is to use them for the same type of functionality as doskey (see below for an example)

- Useful function of making getting to the home directory easier

    ```PowerShell
    function home {Set-Location -Path $Home}
    ```

- This will put PowerShell into admin mode by typing admin

    ```PowerShell
    function admin {Start-Process PowerShell -Verb runAs}
    ```

- This will make it easy to activate python venv environments (you have to have changed the ExecutionPolicy as shown above)

    ```PowerShell
    function activate {
        param(
            [Parameter(Mandatory = $true)]
            [string]$env_name
        )
        cd "$Home\$env_name\Scripts"
        .\Activate.ps1
    }
    ```

- Add whatever output you have from some command into an array for later use (particularly useful for foreach loops)

    ```PowerShell
    function ToArray
    {
        begin
        {
            $output = @();
        }
        process
        {
            $output += $_;
        }
        end
        {
            return ,$output;
        }
    }

    $ModuleList = Get-Module -List | ToArray -Property Name
    ```

- Check to see if a program is installed on your PC

    ```PowerShell
    $installed = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName
    $installed
    ```

    - To extend on this you can do the following to check if a particular application is installed

        ```PowerShell
        function check_if_installed($p1) {
            $software = $p1;
            $installed = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match $p1).Length -gt 0
            If (-Not $installed) {
                Write-Host "'$software'  is not installed.";
            }
            else {
                Write-Host "'$software' is installed."
            }
            return $installed
        }
        check_if_installed -p1 "Visual Studio Code"
        ```

- Run a command prompt from within powershell

   ```PowerShell
   cmd.exe /c "conda activate base"
   ```

### Aliases

- Aliases are basically shorcuts that are specified to mean some other larger command. For example if you want to create a file you can use the command `New-Item test.txt` which will create a file called `text.txt` or you can use the alias `ni text.txt` which will do the same thing. To see all available aliases use the command `Alias`.

- More information about setting aliases can be found [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias) or you can use the following example as a guide: `Set-Alias -Name list -Value Get-ChildItem -Force` this creates an alias `list` that will show all of the items in a folder but also show the hidden items


### Random Useful Commands

- To get the help information for any command or cmdlet use `help cmdlet` where cmdlet is the command about which you want more information. An example is `help Get-ChildItem`.
- To get the full list of keyboard shortcuts use these keyboard keys: `ctrl+alt+shift+.`
- To see the commands you've used you can see them all using `Get-History` or the alias `history`.
- To see the environment variables you can do this: `Get-ChildItem Env:` or for path: `$Env:Path -split ";"`
- For uninstalling modules just insert the name of the module next to the $name variable and run it

    ```PowerShell
    Get-InstalledModule -Name $name -AllVersions | Uninstall-Module
    ```

- Enable WSL 2 in Windows

    ```PowerShell
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    wsl --set-default-version 2
    ```

## Using PowerShell on Windows

- There are some OS specific things you have to worry about these commands help with that:

    ```PowerShell
    $IsLinux
    $IsMacOS
    $IsWindows
    ```

- Connecting to other Linux computers using SSH.
    - Make sure you're logged into a VPN when needed (for example using Cisco AnyConnect Secure Mobility Client)
    - There are two options that I'm aware of
        - [PuTTy](https://putty.org/) (you can also install this using `choco install putty.install`) is a popular Windows option that after installed can be launched and used through their GUI.
        - OpenSSH  is a newer option that comes with Windows
            - You can install using this command in PowerShell `Install-Module Microsoft.PowerShell.RemotingTools` and then load it using this command in PowerShell `Import-Module Microsoft.PowerShell.RemotingTools`
    - For passwordless login you must do the following:
        - Go to the correct location for the keygen program `C:\Windows\System32\OpenSSH` then run the program `.\ssh-keygen.exe`
        - Once you've done that you can then tell PowerShell to always connect to a linux or macOS machiene using these ssh keys using the following code:

        ```PowerShell
        $USER_AT_HOST="username@hostname"
        $PUBKEYPATH="$HOME\.ssh\id_rsa.pub"
        $pubKey=(Get-Content "$PUBKEYPATH" | Out-String); ssh "$USER_AT_HOST" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '${pubKey}' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
        ```

- Refreshing an environment after something has been installed is a very useful command. Simply enter `refreshenv` and all new settings and path variables will now be available in the current shell session.

## Using PowerShell on MacOS

- I'm a big fan of PowerShell mostly because it is the shell that I'm most familiar with. It is also usable on all platforms so you can learn PowerShell once and never have to learn much of any other terminal syntax no matter what platform you're using. To get it onto MacOS find the instructions on [this site](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos). Below that are the instructions for installing PowerShell on MacOS:

    ```sh
    # Install PowerShell
    brew cask install powershell
    # Start PowerShell
    pwsh
    ```

- A useful command for making sure that your MacOS commands only work on MacOS

    ```PowerShell
    $IsMacOS
    ```

## Using PowerShell on Linux

- I'm a big fan of PowerShell mostly because it is the shell that I'm most familiar with. It is also usable on all platforms so you can learn PowerShell once and never have to learn much of any other terminal syntax no matter what platform you're using. To get it onto Linux find the instructions on [this site](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux). The instructions to do this on Ubuntu are below:

    ```sh
    # get the version of ubuntu
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
    ```

    - Note: the snap store doesn't work out the box in Ubuntu when using WSL, there is a work around which is below along with the installation command for PowerShell using the snap store. (The snap store commands can also be found in the first code block of [this section](../other_software/bash.md#ubuntu-setup))

        ```sh
        # install the snap store and then check to see if it installed correctly
        sudo apt-get update && sudo apt-get install -yqq daemonize dbus-user-session fontconfig
        sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
        exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME
        snap version
        # install PowerShell from the snap store
        sudo snap install powershell --classic
        ```

- A useful command for making sure that your MacOS commands only work on MacOS

    ```PowerShell
    $IsLinux
    ```

## CMD

### doskey macros

doskey is a macro system for command prompt. If you enter the correct code they can also be used in PowerShell (show below)

for example, on unix systems if you press `~` and enter then it brings you to the home directory. To replicate this on Windows enter the following (i use `home` instead of `~`):

```cmd
doskey home=cd %homepath%
```
