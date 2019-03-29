$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/azirevpn/azclient/releases/download/v0.5/AzireVPN-0.5.exe'
  checksum      = '74ad2f2b5cbe8f1f073c5f25e14df80cd431caffa39b7d656ec879eb86bb39ef'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs