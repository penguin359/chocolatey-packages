$ErrorActionPreference = 'Stop'

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "LosslessCut.lnk"
if (Test-Path $programsFilePath) { Remove-Item $programsFilePath }

# Remove send to menu shortcut
$sendtoPath = "$env:APPDATA\Microsoft\Windows\SendTo\"
$sendtoFilePath = Join-Path $sendtoPath "Merge videos in LosslessCut.lnk"
if (Test-Path $sendtoFilePath) { Remove-Item $sendtoFilePath }

# Remove File Association for .MP4
Remove-Item -Recurse -Force -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut" 
Remove-Item -Recurse -Force -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe"