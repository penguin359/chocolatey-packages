# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Eclipse IDE for C-C++ Developers.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }