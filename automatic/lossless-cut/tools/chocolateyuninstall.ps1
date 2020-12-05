$ErrorActionPreference = 'Stop'
# Remove start menu shortcut
$programs = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$shortcutFilePath = Join-Path $programs "LosslessCut.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
