# Delete start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AGW Multi Activités.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Delete program files excepted txt files.
Remove-Item "$env:ProgramFiles\AGW_Multi_Activites\*" -exclude "*.txt", "*.log"