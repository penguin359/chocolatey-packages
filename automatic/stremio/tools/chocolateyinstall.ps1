$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.120/Stremio+4.4.120.exe'
  checksum     = '02a92cc8572322e6017f20a1c73400d29b2d7d616f84796e10dffdc8181e991b'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
