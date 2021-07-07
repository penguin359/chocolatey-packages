$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://fleetwood.mchambersradio.com/gridtracker/v1.21.0620/GridTracker-Installer.1.21.0620.exe'
  checksum     = 'c3a06dcab19ee1c3bd44f55b4e77e404dc6116d4abcfdd5f2f06de4360e2d3db'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
