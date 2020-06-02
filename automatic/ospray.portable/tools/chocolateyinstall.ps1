$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\ospray-2.1.1.x86_64.windows.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file
