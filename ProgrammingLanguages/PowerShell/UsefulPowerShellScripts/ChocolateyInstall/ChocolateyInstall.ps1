if (!($IsWindows)) {
    Write-Host "This script is written for Windows. It will not work on any other OS."
    exit
}

if (!(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Host "You do not have Administrator rights to run this script. Launch PowerShell with administrator permissions then relauch this script."
    exit
}
else {
    Write-Warning "You have Administrator rights enabled"
}

## Allows for refreashing the environment variables in windows
function Update-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") +
    ";" +
    [System.Environment]::GetEnvironmentVariable("Path", "User")
}

if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
    Write-Host "Chocolatey has not yet been installed. Installing Chocolatey now."
    Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null
}

# TODO: Add winget installation command or instructions
# TODO: Add the ability to read in from some file the names of programs you want to install

# Installing Chocolatey Packages by Domain of Package
Write-Host "Installing Chocolatey Packages by Domain of Package"

$Packages = "firefox", "googlechrome", "microsoft-edge-insider"
Write-Host "Installing Browsers"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "git", "microsoft-windows-terminal", "nodejs", "pandoc", "texlive"
Write-Host "Installing Dev tools"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "cascadia-code-nerd-font", "fira", "firacodenf"
Write-Host "Installing Fonts"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "vlc"
Write-Host "Installing Media Programs"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "dotnet-sdk", "julia", "powershell-core", "pyenv-win", "r.project --params `'`"/AddToPath`"`'", "typescript"
Write-Host "Installing Programming Languages"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "vscode", "r.studio"
Write-Host "Installing Text editors / IDEs"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "7zip", "bottom", "ditto", "everything", "hwmonitor", "imagemagick", "powertoys", "quicklook", "starship", "WinDirStat"
Write-Host "Installing Utilities + other"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
$Packages = "calibre", "discord", "imageglass", "logitech-options", "potplayer", "speedcrunch", "sumatrapdf", "telegram", "zotero"
Write-Host "Installing Windows Applications"
ForEach ($PackageName in $Packages) {
    Write-Host "    Installing $PackageName"
    choco install $PackageName -y | out-null
}
Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null

# Configuring PowerShell Profile
Write-Host "Configuring PowerShell Profile"
$ConfigContent = Invoke-WebRequest https://gist.githubusercontent.com/ldsands/bf965c404487488b86fa30dcf22cf261/raw/8a4502c6dcc4e5729be411adb5f05aa294b5f9cc/profile.ps1
New-Item $PROFILE.CurrentUserAllHosts -ItemType File -Value $ConfigContent.Content -Force | out-null
Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null

# Configuring PowerShell Prompt Using Starship 
Write-Host "Configuring PowerShell Prompt Using Starship"
# $ENV:STARSHIP_CONFIG = "$HOME\.starship" # add this to powershell profile
if (!(Test-Path -Path "~/.config")) {
    mkdir -p ~/.config | out-null
}
$ConfigContent = Invoke-WebRequest https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/a2a845f29d5712d6434983316d7281fe6a088947/starship.toml
New-Item "~\.config\starship.toml" -ItemType File -Value $ConfigContent.Content -Force | out-null
Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null

# Add OneDrive Utility Folder to Path
Write-Host "Add OneDrive Utility Folder to Path"
New-Item -Path "C:\Users\$env:Username\OneDrive\utilities" -ItemType Directory | out-null
$PATH = [Environment]::GetEnvironmentVariable("PATH", "User")
$newPath = "C:\Users\$env:USERNAME\OneDrive\utilities"
if ( $PATH -notlike "*" + $newPath + "*" ) {
    [Environment]::SetEnvironmentVariable("PATH", "$PATH;$newPath", "User")
}
Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null

# Setting Bottom Config File
Write-Host "Setting Bottom Config File"
if (!(Test-Path -Path "C:\Users\$env:USERNAME\AppData\Roaming\bottom\bottom.toml")) {
    mkdir -p C:\Users\$env:USERNAME\AppData\Roaming\bottom\bottom.toml | out-null
}
$ConfigContent = Invoke-WebRequest https://gist.githubusercontent.com/ldsands/93f985822143f9f5f58567803e5787ef/raw/6aeadc8d1ba513c4008789bbaf96679caf9555af/bottom.toml
New-Item "C:\Users\$env:USERNAME\AppData\Roaming\bottom\bottom.toml" -ItemType File -Value $ConfigContent.Content -Force | out-null
Update-Path | out-null && & $PROFILE.CurrentUserAllHosts | out-null

# # Installing Chocolatey Packages by Domain of Package
# Write-Host "Installing Chocolatey Packages by Domain of Package"

# $Packages = "7+ Taskbar Tweaker"
# Write-Host "Installing Utilities + other"
# ForEach ($PackageName in $Packages) {
#     Write-Host "    Installing $PackageName"
#     choco install $PackageName -y | out-null
# }


# TODO: add rust as an optional package
# TODO: add automatic downloading of powershell core to the .bat file then load the chocolateyinstall.ps1 script to make it all automatic
# TODO: add git configuration
#       git config --global user.name "Prename Name"
#       git config --global user.email "email@example.com"
#       git config --global core.autocrlf true
# TODO: install WSL
