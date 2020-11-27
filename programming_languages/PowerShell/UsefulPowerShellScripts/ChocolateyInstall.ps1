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
}

# TODO: Add winget installation command or instructions
# TODO: Add the ability to read in from some file the names of programs you want to install

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Package Selection'
$form.Size = New-Object System.Drawing.Size(711, 400)
$form.StartPosition = 'CenterScreen'
#Autoscaling settings
$form.AutoScale = $true
$form.AutoScaleMode = "Font"
$ASsize = New-Object System.Drawing.SizeF(7, 15)
$form.AutoScaleDimensions = $ASsize

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Size = New-Object System.Drawing.Size(75, 23)
$OKButton.Top = ($form.Height - 75)
$OKButton.Left = ($form.Width - 100)
$OKButton.Anchor = 'Right,Bottom'
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Size = New-Object System.Drawing.Size(75, 23)
$CancelButton.Top = ($form.Height - 100)
$CancelButton.Left = ($form.Width - 100)
$CancelButton.Anchor = 'Right,Bottom'
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 5)
$label.Size = New-Object System.Drawing.Size(280, 20)
$label.Text = 'Please select all programs you want to install from the list below:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.Listbox
$listBox.Location = New-Object System.Drawing.Point(10, 25)
$listBox.Anchor = 'Left,Top,Bottom,Right'
$listBox.IntegralHeight = $false
$listBox.HorizontalScrollbar = $true
$listBox.Size = New-Object System.Drawing.Size(($form.Width - 125), ($form.Height - 75))
$listBox.SelectionMode = 'MultiExtended'

$ProgramNameArray = ("7zip", "Boxstarter", "Cascadia Code Nerd Font", "Chocolatey Gui", "Discord", "Docker", "Dotnet SDK", "Fira Code Nerd Font", "Fira Font", "Firefox", "Git", "Google Chrome", "Hardware Monitor", "Julie", "Logitech Options", "Microsoft Edge Beta", "Microsoft Windows Terminal", "MikTex", "Node.js", "Oh My Posh", "Pandoc", "PoshGit", "PowerShell Core", "PowerToys", "R", "RStudio", "SpeedCrunch", "Starship", "SumatraPDF", "TeamViewer", "TexLive", "Typescript", "Visual Studio Code", "VLC Media Player", "Zotero")
$CommandsArray = ("choco install -y 7zip", "choco install -y boxstarter", "choco install -y cascadia-code-nerd-font", "choco install -y chocolateygui", "choco install -y discord", "choco install -y docker-desktop", "choco install -y dotnet-sdk", "choco install -y firacodenf", "choco install -y fira", "choco install -y firefox", "choco install -y git", "choco install -y googlechrome", "choco install -y hwmonitor", "choco install -y julia", "choco install -y logitech-options", "choco install -y microsoft-edge-insider", "choco install -y microsoft-windows-terminal", "choco install -y miktex", "choco install -y nodejs", "choco install -y oh-my-posh", "choco install -y pandoc", "choco install -y poshgit", "choco install -y powershell-core", "choco install -y powertoys", "choco install -y r.project --params `'`"/AddToPath`"`'", "choco install -y r.studio", "choco install -y speedcrunch", "choco install -y starship", "choco install -y sumatrapdf", "choco install -y teamviewer", "choco install -y texlive", "choco install -y typescript", "choco install -y vscode", "choco install -y vlc", "choco install -y zotero")
# $SourceArray = ("chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org", "chocolatey.org")

foreach ($ProgramToInstall in $ProgramNameArray) {
    [void] $listBox.Items.Add($ProgramToInstall)
}

$form.Controls.Add($listBox)

$result = $form.ShowDialog()
$form.Dispose()
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $SelectedItems = $listBox.SelectedItems
    $SelectedIndices = $listBox.SelectedIndices
}

foreach ($TargetIndex in $SelectedIndices) {
    $ProgramName = $ProgramNameArray[$TargetIndex]
    Write-Host "Installing $ProgramName"
    Invoke-Expression $CommandsArray[$TargetIndex] | Out-Null
}

# choco install -y 7zip
# choco install 7zip -y

# ForEach ($PackageName in $Packages) {
#     choco install $PackageName -y
# }

# Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop

# #
# $form = New-Object System.Windows.Forms.Form
# $form.MinimumSize = '585,700'
# $form.StartPosition = 'CenterScreen'
# $form.MaximizeBox = $false
# $form.CancelButton = $ExitButton
# #Autoscaling settings
# $form.AutoScale = $true
# $form.AutoScaleMode = "Font"
# $ASsize = New-Object System.Drawing.SizeF(7, 15)
# $form.AutoScaleDimensions = $ASsize
# #
# # Parent Tab Control
# $MainTab = New-Object System.Windows.Forms.TabControl
# $MainTab.Size = '540,465'
# $MainTab.Location = '15,15'
# $MainTab.Name = 'TabPage'
# $MainTab.SizeMode = 'FillToRight'
# $MainTab.Anchor = 'Top,Left,Bottom,Right'

# ################################################################################
# # TabPage 1
# ################################################################################
# $TabPage1 = New-Object System.Windows.Forms.TabPage
# $Tabpage1.Padding = '5,5,5,5'
# $Tabpage1.Text = 'Host SSH'
# $TabPage1.Parent
# #
# $ESXhostList = New-Object System.Windows.Forms.ListView
# $ESXhostList.View = [System.Windows.Forms.View]::Details
# $ESXhostList.Location = '10,15'
# $ESXhostList.Size = '180,-50'
# $ESXhostList.Columns.Add('Host Name', 420) | Out-Null
# $ESXhostList.Columns.Add('SSH Status', 80) | Out-Null
# $ESXhostList.Anchor = 'Top,Left,Bottom,Right'

# #
# $ConnectBtn = New-Object System.Windows.Forms.Button
# $ConnectBtn.Location = '10,-20'
# $ConnectBtn.Size = '54,24'
# $ConnectBtn.Text = 'Connect'
# $ConnectBtn.Anchor = 'Left,Bottom'
# #
# $TabPage1.Controls.AddRange(@($ESXhostList, $ConnectBtn))
# ################################################################################
# # TabPage 2
# ################################################################################
# $TabPage2 = New-Object System.Windows.Forms.TabPage
# $Tabpage2.Padding = '5,5,5,5'
# $Tabpage2.Text = 'Datastores'
# #
# $DSList = New-Object System.Windows.Forms.ListView
# $DSList.View = [System.Windows.Forms.View]::Details
# $DSList.Location = '10,15'
# $DSList.Size = '510,150'
# $DSList.Columns.Add('Name', 160) | Out-Null
# $DSList.Columns.Add('FreeGB', 80) | Out-Null
# # $DSList.Anchor = 'Top,Left,Right'

# #
# $ConnectBtn2 = New-Object System.Windows.Forms.Button
# $ConnectBtn2.Location = '20,190'
# $ConnectBtn2.Size = '54,24'
# $ConnectBtn2.Text = 'Connect'
# #
# $TabPage2.Controls.AddRange(@($DSList, $ConnectBtn2))
# #
# $MainTab.Controls.AddRange(@($TabPage1, $TabPage2))
# #
# # Info/Logging Window
# $ProgressLog = New-Object System.Windows.Forms.TextBox
# $ProgressLog.Location = '15,570'
# $ProgressLog.Size = '540,80'
# $ProgressLog.Multiline = $true
# $ProgressLog.Anchor = 'Left,Bottom,Right'
# $ProgressLog.TabStop = $false
# $ProgressLog.ScrollBars = "Vertical"
# $ProgressLog.ReadOnly = $true
# #
# # Add all the Form controls
# $form.Controls.AddRange(@($MainTab, $ProgressLog))
# #
# #
# #End
# # Show form
# $form.ShowDialog() | Out-Null
# $form.Dispose()