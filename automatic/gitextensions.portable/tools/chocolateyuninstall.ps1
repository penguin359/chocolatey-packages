$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Git Extensions.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }