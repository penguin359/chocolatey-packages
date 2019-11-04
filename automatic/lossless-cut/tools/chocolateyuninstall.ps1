$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$link       = 'LosslessCut.lnk'
$installDir = Get-Content -Path "$toolsDir\installDir"

# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" "$link"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Remove desktop icon
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$Env:USERPROFILE\Desktop" "$link"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Remove parent folder if empty
if( (Get-ChildItem "$installDir" | Measure-Object).Count -eq 0) { Remove-item -Path "$installDir" }