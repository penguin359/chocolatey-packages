$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '4287622eff30c60772f5320708a8ac3e77154de2b81430d328b524439a82df2e'
  checksumType = 'sha256'

  silentArgs   = "-q"
}

Install-ChocolateyPackage @packageArgs
