$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "APO-OK.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }