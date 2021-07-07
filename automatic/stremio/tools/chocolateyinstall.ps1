$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.142/Stremio+4.4.142.exe'
  checksum     = 'ff44d700f809071353ab3f6751bd257b5e6918a76288af1e5d086316a6e91b78'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
