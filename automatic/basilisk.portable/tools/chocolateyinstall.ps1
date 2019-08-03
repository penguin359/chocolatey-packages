$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'http://eu.basilisk-browser.org/release/basilisk-latest.win32.zip'
  checksum      = 'CF43FA119ABEA7381927163BF359A0B6E0CE27CA4880D4C89438A789C285EA9E'
  checksumType  = 'sha256'
  
  url64bit      = 'http://eu.basilisk-browser.org/release/basilisk-latest.win64.zip'
  checksum64    = '674A5272F1FE215211ACB5DC6DA0ED7B749DFB74C4D0733EA6922625F5745643'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
