$ErrorActionPreference = 'Stop';
$toolsDir = $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters

if ( $pp.InstallDir ) { $installDir = $pp.InstallDir }
Write-Host "$env:ChocolateyPackageName is going to be installed in '$installDir'..."

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$installDir\LosslessCut.exe"

  url            = 'https://github.com//mifi/lossless-cut/releases/download/v2.7.1/LosslessCut-win.exe'
  checksum       = '48d6c14e346488e944c912268218e7afa299aaf016139daf602f11ab325534c6'
  checksumType   = 'sha256'

  url64          = 'https://github.com//mifi/lossless-cut/releases/download/v2.7.1/LosslessCut-win.exe'
  checksum64     = '48d6c14e346488e944c912268218e7afa299aaf016139daf602f11ab325534c6'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Shortcut parameters
$sparams = @{
  link       = 'LosslessCut.lnk'
  targetPath = $packageArgs.fileFullPath
}

# Install start menu shortcut
if ( !$pp.NoStartMenu ) {
  Write-Host "Creating Start menu shortcut for $env:ChocolateyPackageName..."
  $programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
  $sparams.shortcutFilePath = Join-Path $programs $sparams.link
  Install-ChocolateyShortcut @sparams
}

# Install desktop icon
if ( $pp.DesktopIcon ) {
    Write-Host "Creating Desktop icon for $env:ChocolateyPackageName..."
    $sparams.ShortcutFilePath = Join-Path "$Env:USERPROFILE\Desktop" $sparams.link
    Install-ChocolateyShortcut @sparams
}

Set-Content -Path "$toolsDir\installDir" -value "$installDir"
