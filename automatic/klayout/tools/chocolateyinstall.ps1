$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.12-win32-install.exe'
  checksum      = 'd8a1b8f689688aa061ad5fffa5ec8a05539da2459abc6493b8f0918fcbfa1a1f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.12-win64-install.exe'
  checksum64    = 'b25c3bb9bf9a1aa602c72481914a5d096892df23b90b371ba19185ed49d7e4a2'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
