$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.7-win32-install.exe'
  checksum      = '6b99d6226ac56f2261e5b28363d1bae37491904baac78018fed49e9d435dd1be'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.7-win64-install.exe'
  checksum64    = '02906e399850c6cacb678c1929c014f3ddc1ba45ae47341a60fa5478049b3116'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
