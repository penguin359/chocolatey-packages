$ErrorActionPreference = 'Stop'
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Dont Sleep.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
