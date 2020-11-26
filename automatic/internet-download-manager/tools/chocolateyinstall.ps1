$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman638build14.exe'
  checksum      = '0ef2da9d929b8760436d0540eaba76042bb65e14be8b5741e0e93d3e8eeb00b4'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
