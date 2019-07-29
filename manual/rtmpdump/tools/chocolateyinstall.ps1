$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\rtmpdump-2.4-2015-12-15.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file