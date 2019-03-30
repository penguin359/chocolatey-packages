$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://build.openvpn.net/downloads/releases/tap-windows-9.21.2.exe'

  checksum      = '645BEE92BA4E9F32DDFDD9F8519DC1B9F9FF0B0A8E87E342F08D39DA77E499A9'
  checksumType  = 'sha256'
  
  silentArgs	= "/S"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs