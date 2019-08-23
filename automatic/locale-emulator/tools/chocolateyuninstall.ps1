$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove registry changes.
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyuninstall.ahk`""
Start-ChocolateyProcessAsAdmin -ExeToRun $toolsDir\Locale.Emulator.2.4.1.0\LEinstaller.exe

# Remove link in start menu.
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }