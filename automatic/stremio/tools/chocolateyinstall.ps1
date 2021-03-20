$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.132/Stremio+4.4.132.exe'
  checksum     = 'ca2f062a46006715dc4339740d044a04eda98db288c92483dad8494c5638d2cd'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
