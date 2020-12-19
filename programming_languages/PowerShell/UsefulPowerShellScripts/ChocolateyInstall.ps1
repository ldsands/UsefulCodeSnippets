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

if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
    Write-Host "Chocolatey has not yet been installed. Installing Chocolatey now."
    Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    refreshenv | out-null && & $PROFILE.CurrentUserAllHosts | out-null
}

# TODO: Add winget installation command or instructions
# TODO: Add the ability to read in from some file the names of programs you want to install


$Packages = "firefox", "googlechrome", "microsoft-edge-insider"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Browsers"
    choco install $PackageName -y | out-null
}

$Packages = "git", "microsoft-windows-terminal", "nodejs", "pandoc", "texlive"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Dev tools"
    choco install $PackageName -y | out-null
}

$Packages = "cascadia-code-nerd-font", "fira", "firacodenf"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Fonts"
    choco install $PackageName -y | out-null
}

$Packages = "vlc"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Media Programs"
    choco install $PackageName -y | out-null
}

$Packages = "dotnet-sdk", "julia", "powershell-core", "r.project --params `'`"/AddToPath`"`'", "typescript"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Programming Languages"
    choco install $PackageName -y | out-null
}

$Packages = "vscode", "r.studio"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Text editors / IDEs"
    choco install $PackageName -y | out-null
}
$Packages = "7zip", "bottom", "hwmonitor", "powertoys", "starship"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Utilities + other"
    choco install $PackageName -y | out-null
}

$Packages = "discord", "logitech-options", "speedcrunch", "sumatrapdf", "zotero"
ForEach ($PackageName in $Packages) {
    Write-Host "Installing Windows Applications"
    choco install $PackageName -y | out-null
}

refreshenv | out-null && & $PROFILE.CurrentUserAllHosts | out-null

Write-Host "Congiguring Powershell Profile"
$ConfigContent = Invoke-WebRequest https://gist.githubusercontent.com/ldsands/bf965c404487488b86fa30dcf22cf261/raw/3d2a63514ed17f4eff5084b20a8f972157366dd7/profile.ps1
New-Item $PROFILE.CurrentUserAllHosts -ItemType File -Value $ConfigContent.Content -Force | out-null
refreshenv | out-null && & $PROFILE.CurrentUserAllHosts | out-null

Write-Host "Configuring Starship"
# $ENV:STARSHIP_CONFIG = "$HOME\.starship" # add this to powershell profile
if (!(Test-Path -Path "~/.config")) {
    mkdir -p ~/.config | out-null
}
$ConfigContent = Invoke-WebRequest https://gist.githubusercontent.com/ldsands/4e7fc375df318dd90bb44ae9ecbc5863/raw/35c8d04ea8d35907985456548d60c19f5cad8e3c/starship.toml
New-Item "~\.config\starship.toml" -ItemType File -Value $ConfigContent.Content -Force | out-null
refreshenv | out-null && & $PROFILE.CurrentUserAllHosts | out-null



# TODO: add rust for installing starship and bottom
# TODO: add starship config.toml from github gist
# TODO: add automatic downloading of profile for powershell from github gist
# TODO: add git configuration
# TODO: install WSL
