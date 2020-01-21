$ErrorActionPreference = 'Stop';
$toolsDir = $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters

if ( $pp.InstallDir ) { $installDir = $pp.InstallDir }
Write-Host "pkcs11admin is going to be installed in '$installDir'"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$installDir"
  file        = "$toolsDir\Pkcs11Admin-0.5.0.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file


# Shortcut parameters
$OSArchitectureWidth = Get-OSArchitectureWidth
$sparams = @{
  targetPath = Join-Path $installDir "Pkcs11Admin-0.5.0\Pkcs11Admin-x${OSArchitectureWidth}.exe"
}

# Install start menu shortcut
if ( !$pp.NoStartMenu ) {
  Write-Host "Creating Start menu shortcut for pkcs11admin..."
  $programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
  $sparams.shortcutFilePath = Join-Path $programs "Pkcs11Admin.lnk"
  Install-ChocolateyShortcut @sparams
}

# Install desktop icon
if ( $pp.DesktopIcon ) {
    Write-Host "Creating Desktop icon for pkcs11admin..."
    $sparams.ShortcutFilePath = "$Env:USERPROFILE\Desktop\Pkcs11Admin.lnk"
    Install-ChocolateyShortcut @sparams
}
