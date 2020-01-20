$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs 'Log4OM 2.lnk'
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$shortcutFilePath = Join-Path $programs 'Log4OM NG Config Manager.lnk'
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }