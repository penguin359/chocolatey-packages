$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  
  url           = 'https://github.com/GNS3/gns3-gui/releases/download/v2.1.16/GNS3-2.1.16-all-in-one.exe'
  checksum      = '8a6b1a3fee211adac22b5cbccb33b456a393d7017747750c8c9cc25b8c06f54d'
  checksumType  = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

$process = Get-Process gns3 -ErrorAction SilentlyContinue
if ($process) { $process | Stop-Process }
