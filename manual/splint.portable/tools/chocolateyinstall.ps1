$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\splint-3.1.2.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file