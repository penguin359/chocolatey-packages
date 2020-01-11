$ErrorActionPreference = 'Stop'
# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "MorseCode.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$shortcutFilePath = Join-Path $programs "MorseTest.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }