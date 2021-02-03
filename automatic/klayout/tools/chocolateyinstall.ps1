$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.10-win32-install.exe'
  checksum      = '3a8d1ad8ded88ed0e0c652e9bf885e8bb0542c0ae1d31e0e404467391bbecd3e'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.10-win64-install.exe'
  checksum64    = '855a3150c8d71cf32b0b5b5901991e99871b8d5c704d3165b48129c9af1b4a75'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
