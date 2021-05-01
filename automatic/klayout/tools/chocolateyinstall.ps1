$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27-win32-install.exe'
  checksum      = '251c64bcf51c0a523ed4194599ac3963d8fe4fc33c644bc41b5524b5d51b3e45'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27-win64-install.exe'
  checksum64    = 'be1970601b8d62dd17f31cb0d7bac7d368d1501f9632a51af660fa8d99d4a27b'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
