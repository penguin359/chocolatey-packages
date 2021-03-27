$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.135/Stremio+4.4.135.exe'
  checksum     = 'addb3bd5aa0d1f2570d5b97b8c975abdef251bc569274a0c1ccdb7f3e91e0946'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
