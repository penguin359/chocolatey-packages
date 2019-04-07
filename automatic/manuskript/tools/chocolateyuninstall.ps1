$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }