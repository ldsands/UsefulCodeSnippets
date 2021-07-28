Write-Host "Good Morning Emmitt! Please wait while I finish starting up."
Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerToys (Preview)"
Start-Sleep -s 5
Start-Process shell:AppsFolder\Microsoft.Todos_8wekyb3d8bbwe!App
Start-Sleep -s 5
Start-Process shell:AppsFolder\52299SuperElement.119436511DDC8_792yctbvabkar!App
Start-Sleep -s 5

# try {
#     Import-Module VirtualDesktop
# }
# catch {
#     Install-Module -Name VirtualDesktop -AllowClobber -Scope AllUsers
#     Import-Module VirtualDesktop
# }

# Start-Sleep -s 5

# Switch to desktop 2 (count starts with 0)
# Get-Desktop 1 | Switch-Desktop

# Move obs64.exe to desktop 3
# (ps obs64)[0].MainWindowHandle | Move-Window (Get-Desktop 2) | Out-Null
