# Stop Launchy
$process = Get-Process Launchy | Out-Null
if ($process) { $process | Stop-Process }

# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Launchy.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }