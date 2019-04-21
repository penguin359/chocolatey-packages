$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Umbrello.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }