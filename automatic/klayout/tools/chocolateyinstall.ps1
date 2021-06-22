$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.2-win32-install.exe'
  checksum      = 'ac2ae29c55d6c87ddbf98ffb20ab4dbc934f72915fdedbbc09cc3486f3fa63f0'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.2-win64-install.exe'
  checksum64    = '93738c23dedc90f0bd4164841780f5910217fca7812851a19a4ad6a8c8f296cb'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
