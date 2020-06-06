$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.6-win32-install.exe'
  checksum      = '5ddb3cbfaa997b7ab974cae71ca4a573ad31005d685f5cfac491a9c2a2453280'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.6-win64-install.exe'
  checksum64    = '325465b94d656d6f350c67ff8673951b4117f515cc3cbe43cf3154ed2a7d237b'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
