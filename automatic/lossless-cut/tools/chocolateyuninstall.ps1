$ErrorActionPreference = 'Stop'
# Remove start menu shortcut
$programs = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$shortcutFilePath = Join-Path $programs "LosslessCut.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Remove File Association for .MP4
Remove-Item -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut" -force;
Remove-Item -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe" -force;