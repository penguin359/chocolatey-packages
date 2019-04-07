$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Laragon.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }