# PowerShell and Cmd Prompt

Note that in almost every situation PowerShell is vastly superior to cmd prompt. Also, PowerShell core (or just PowerShell as of version 7) is cross platform and can be used and linux mac or windows

If you're planning on executing PowerShell scripts you will probably want to run the following (otherwise nothing will run):

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Installation

### Using dotnet Sdk

You can install PowerShell using the dotnet sdk (core or standard) on any platform. However you will not be able to get context menu use with this method (for more details [see this section under my dotnet instructions](../programming_languages/dotnet/dotnet_install_overview.md#dotnet-tools))

## PowerShell profiles

- to make functions and other settings persist across terminals, reboots and closing PowerShell run the following code
    - for linux just change the $PROFILE.CurrentUserAllHosts to $profile

```PowerShell
code $PROFILE.CurrentUserAllHosts
$ProfileTemplate = @"
function listProfileFunctions {
    `$profileFunctions = @("home", "admin", "ToArray", "checkAdmin", "GetOneCoreVoices", "GetInstalledVoices", "InstallAllModules", "RestartWSL")
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

## navigate up easier (one level .. two levels ... three levels ....)
function cd..  { cd ..\ }
function cd...  { cd ..\.. }
function cd.... { cd ..\..\.. }

## Install the normal modules that I use just type InstallAll
function InstallAllModules() {
    `$requiredModules = @("PSReadLine", "posh-git","oh-my-posh", "Get-ChildItemColor")
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
    Import-Module posh-git
    Import-Module oh-my-posh
    Set-Theme Paradox
}

function RestartWSL() {
    if (`$IsWindows) {
        Get-Service LxssManager | Restart-Service
    }
}

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

- this will put PowerShell into admin mode by typing admin

    ```PowerShell
    function admin {Start-Process PowerShell -Verb runAs}
    ```

- this will make it easy to activate python venv environments (you have to have changed the ExecutionPolicy as shown above)

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

- add whatever output you have from some command into an array for later use (particularly useful for foreach loops)

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

- check to see if a program is installed on your PC

    ```PowerShell
    $installed = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName
    $installed
    ```

    - to extend on this you can do the following to check if a particular application is installed

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

- run a command prompt from within powershell

   ```PowerShell
   cmd.exe /c "conda activate base"
   ```

### Useful random commands

- for uninstalling modules just insert the name of hte module next to the $name variable and run it

    ```PowerShell
    Get-InstalledModule -Name $name -AllVersions | Uninstall-Module
    ```

- enable WSL 2 in Windows

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

## Using PowerShell on MacOS

- I'm a big fan of PowerShell mostly because it is the shell that I'm most familiar with. It is also usable on all platforms so you can learn PowerShell once and never have to learn much of any other terminal syntax no matter what platform you're using. To get it onto MacOS find the instructions on [this site](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos). Below that are the instructions for installing PowerShell on MacOS:

    ```sh
    # Install PowerShell
    brew cask install powershell
    # Start PowerShell
    pwsh
    ```

- a useful command for making sure that your MacOS commands only work on MacOS

    ```PowerShell
    $IsMacOS
    ```

## Using PowerShell on Linux

- I'm a big fan of PowerShell mostly because it is the shell that I'm most familiar with. It is also usable on all platforms so you can learn PowerShell once and never have to learn much of any other terminal syntax no matter what platform you're using. To get it onto Linux find the instructions on [this site](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux). The instructions to do this on Ubuntu are below:

    ```sh
    # Download the Microsoft repository GPG keys
    wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    # Register the Microsoft repository GPG keys
    sudo dpkg -i packages-microsoft-prod.deb
    # Update the list of products
    sudo apt-get update
    # Enable the "universe" repositories
    sudo add-apt-repository universe
    # Install PowerShell
    sudo apt-get install -y powershell
    # Start PowerShell
    pwsh
    ```

- a useful command for making sure that your MacOS commands only work on MacOS

    ```PowerShell
    $IsLinux
    ```

### doskey macros (for cmd on Windows)

doskey is a macro system for command prompt. If you enter the correct code they can also be used in PowerShell (show below)

for example, on unix systems if you press `~` and enter then it brings you to the home directory. To replicate this on Windows enter the following (i use `home` instead of `~`):

```cmd
doskey home=cd %homepath%
```
