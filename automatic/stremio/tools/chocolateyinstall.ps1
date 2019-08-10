$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/win/v4.4.77/Stremio+4.4.77.exe'
  checksum     = 'bf47ab1312097d2283ed74b2a6ac46978ea3a31fb93e521c115a087060d5b145'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs