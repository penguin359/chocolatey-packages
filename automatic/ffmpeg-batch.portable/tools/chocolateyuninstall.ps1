$ErrorActionPreference = 'Stop'
# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "FFmpeg Batch Portable.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
