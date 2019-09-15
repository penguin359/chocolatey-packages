$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\SoftHSM2-2.5.0-portable.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file