$ErrorActionPreference = 'Stop'
# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Crypto Notepad.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
