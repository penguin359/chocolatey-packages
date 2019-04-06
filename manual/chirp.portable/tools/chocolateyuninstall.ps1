$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "CHIRP.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }