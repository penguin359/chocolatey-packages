$ErrorActionPreference = 'Stop';

# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Logisim Evolution.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

Remove-Item "$env:ProgramFiles\logisim-evolution\logisim-evolution.jar"
if ( -Not (Test-Path -Path $env:ProgramFiles\logisim-evolution\*)) { Remove-Item $env:ProgramFiles\logisim-evolution }