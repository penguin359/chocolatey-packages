$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters

# PARAMETERS
If ($PackageParameters.InstallDir) { $installDir = $PackageParameters.InstallDir }
  Else { $installDir = "$toolsDir" }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$installDir"
  file          = "$toolsDir\unpaper-6.1-windows-i686.zip"
  file64        = "$toolsDir\unpaper-6.1-windows-x86_64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file
