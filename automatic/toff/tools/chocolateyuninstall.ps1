$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "TOff.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }