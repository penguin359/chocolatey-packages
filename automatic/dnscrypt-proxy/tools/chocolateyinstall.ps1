$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  filefullpath  = "$toolsDir\dnscrypt-proxy-win32-2.0.23_x32.zip"
  filefullpath64= "$toolsDir\dnscrypt-proxy-win64-2.0.23_x64.zip"
}

Get-ChocolateyUnzip @packageArgs
