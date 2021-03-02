# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'X32 Edit.lnk'
If ( Test-Path "$shortcutFilePath" ) { Remove-Item "$shortcutFilePath" }