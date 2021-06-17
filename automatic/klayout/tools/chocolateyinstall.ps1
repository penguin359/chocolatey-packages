$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.1-win32-install.exe'
  checksum      = 'b0ca7bd0856db8e3ed153621539f3406587f39e2300b1591f1eb39574dd172ba'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.1-win64-install.exe'
  checksum64    = '476e604e3eb684a56b79e1aa04d66ecae9f355a85072fdb4cdd710f09d1b2d69'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
