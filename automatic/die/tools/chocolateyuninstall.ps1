# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Detect It Easy.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$shortcutFilePath = Join-Path $programs "Detect It Easy Lite.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }