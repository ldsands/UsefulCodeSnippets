:::: TODO: add automatic downloading of powershell core to the .bat file then load the chocolateyinstall.ps1 script to make it all automatic
:::: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install all the packages
:::: Browsers
choco install -y firefox
choco install -y googlechrome
choco install -y microsoft-edge-insider

:::: Dev tools
choco install -y git
choco install -y microsoft-windows-terminal
choco install -y nodejs
choco install -y pandoc
choco install -y r.studio
choco install -y texlive

:::: Fonts
choco install -y cascadia-code-nerd-font
choco install -y fira
choco install -y firacodenf

:::: Media
choco install -y vlc

:::: Programming Languages
choco install -y dotnet-sdk
choco install -y julia
choco install -y powershell-core
choco install -y r.project --params `'`"/AddToPath`"`'
choco install -y typescript

:::: Text editors / IDEs
choco install -y vscode

:::: Utilities + other
choco install -y 7zip
choco install -y hwmonitor
choco install -y powertoys

:::: Windows Applications
choco install -y discord
choco install -y logitech-options
:: choco install -y office365proplus
choco install -y speedcrunch
choco install -y sumatrapdf
choco install -y zotero
