$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/marktext/marktext/releases/download/v0.13.65/marktext-setup-0.13.65.exe'
  checksum      = '356E44EB38F22B2A3D0E896506E40FD6884B3B7AAC14BD61D4571103E85DAB52'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs