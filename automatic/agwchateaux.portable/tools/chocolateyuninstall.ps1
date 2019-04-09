# Delete start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AGW Châteaux.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Delete program files excepted txt files.
Remove-Item "$env:ProgramFiles\AGW_Chateaux\*" -exclude "*.txt", "*.log"