$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "PhonerLite.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }