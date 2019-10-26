$ErrorActionPreference = 'Stop'

# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BtoPDF.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PtoBMP.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }