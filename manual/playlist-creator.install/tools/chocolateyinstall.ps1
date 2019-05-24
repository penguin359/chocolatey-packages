$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.oddgravity.de/download/dc/PlaylistCreator3_Setup.exe'
  checksum     = '178E90C01F265EC4E7B0EA280C2BA3E5BF8DB9B660FAD6709A147F06DC2AD2BF'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs