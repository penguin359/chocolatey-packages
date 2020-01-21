$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'Pkcs11Admin-0.5.0.zip'
$link = "Pkcs11Admin.lnk"

# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" "$link"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Remove desktop icon
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$Env:USERPROFILE\Desktop" "$link"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
