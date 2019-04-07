$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Apache NetBeans.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }