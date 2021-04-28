$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.137/Stremio+4.4.137.exe'
  checksum     = 'c719c426be76657f5a11c050728a79e0ca3f5e4e6deb9d836faeb2368fac0ed3'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
