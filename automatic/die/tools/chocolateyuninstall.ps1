# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs 'Detect It Easy.lnk'
If (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }