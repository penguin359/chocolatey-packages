$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '48b8bf653baf4c2733b7a4fce679032a5829fa9cf6a5520de25af1db525f21fb'
  checksumType = 'sha256'

  silentArgs   = "-q"
}

Install-ChocolateyPackage @packageArgs
