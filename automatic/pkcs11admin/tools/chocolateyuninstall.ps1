Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'Pkcs11Admin-0.5.0.zip'

# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Pkcs11Admin.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

# Remove desktop icon
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$Env:USERPROFILE\Desktop\pkcs11admin.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }