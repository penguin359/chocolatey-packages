$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.6-win32-install.exe'
  checksum      = '356cf1bb0dd3c8ebc82ccde630d3344c41baa61d308f82a30ae72d8819c3562f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.6-win64-install.exe'
  checksum64    = '4e678559b340b8e984e43e51c3e20b3b55850ff02e440b9090231c7fdb90409f'
  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs