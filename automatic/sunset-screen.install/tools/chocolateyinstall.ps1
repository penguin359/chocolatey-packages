$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '3f5498ead884386ccbd26426ed1c50d2a7a5aeeeca523e8e2bbb4b812280b3ed'
  checksumType = 'sha256'

  silentArgs   = "-q"
}

Install-ChocolateyPackage @packageArgs
