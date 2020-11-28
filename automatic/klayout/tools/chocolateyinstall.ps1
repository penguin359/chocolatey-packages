$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.9-win32-install.exe'
  checksum      = 'f876e364ece25efd2fe6ed4b6623c6f7da04df74d3ea4d8654d9774555c7f7a2'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.9-win64-install.exe'
  checksum64    = '69e811a0070a28a2592713efaaf096fbea59606c177f5ba736370da83a3dce1a'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
