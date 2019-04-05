$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "WakeupOnStandBy.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }