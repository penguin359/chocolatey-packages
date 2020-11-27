$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.2.2-Setup.exe'
  checksum      = '279084bca9b7d1e138a54280c052be4d4ba2a2e6cfb4c42d0d27d70f490a1c89'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
