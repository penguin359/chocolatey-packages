$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = 'BCA5A68407C752A2DDCF028B64A8CA72FDCA985006C09349487541E158F83FA4'
  checksumType = 'sha256'

  silentArgs   = "-q"
}

Install-ChocolateyPackage @packageArgs