$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.11-win32-install.exe'
  checksum      = '9dd9d9e4e781e2467652b3c3b460f9591d0ee1ce0d5bc59120559b8dc7b9df46'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.11-win64-install.exe'
  checksum64    = 'b26b216f4ed0c719ca0ad9e7620df3f2e53221309cdc1a0208579eadf75fede1'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
