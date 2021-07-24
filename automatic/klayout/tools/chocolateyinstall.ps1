$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.3-win32-install.exe'
  checksum      = '0b62209d0d5700ca6b191572351681f5845a47d736da17c3409a77a8e7759e3f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.3-win64-install.exe'
  checksum64    = '19fdda4cf861712805847109442c6d3a6700a010ccffcb77982aad32edc79de0'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
