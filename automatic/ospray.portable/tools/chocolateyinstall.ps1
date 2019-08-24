$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\ospray-1.8.5.windows.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file