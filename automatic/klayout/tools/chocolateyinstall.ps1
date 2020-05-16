$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.5-win32-install.exe'
  checksum      = 'b6bdceacca30f2c40ea610ce3da168812bd9fdc434fa8f6b5f01249eeebb23c3'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.5-win64-install.exe'
  checksum64    = '481956d15af936ad2b907a50b2a0b018404093cb43ef235bcbc3bc593ee56b0f'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
