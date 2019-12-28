$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.2-win32-install.exe'
  checksum      = '8f3bd950b68500cb204e02d4b0fc4e2f1cbc4604550a2c75dc46439c506dd5db'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.2-win64-install.exe'
  checksum64    = '8e11abf5c2b9d723519c687845c8774e4025ab223e198f6155d7243438aa0c21'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
