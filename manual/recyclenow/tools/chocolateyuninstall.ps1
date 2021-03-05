$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'RecycleNOW.zip'

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "RecycleNOW.lnk"
If (Test-Path "$programsFilePath") { Remove-Item "$programsFilePath" }

# Remove desktop icon
$shortcutFilePath = "$Env:USERPROFILE\Desktop\RecycleNOW.lnk"
If (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }