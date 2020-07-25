$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.116/Stremio+4.4.116.exe'
  checksum     = '99fddb28141ae88d658096660e5fe207fb1cb7fd0197bc7e8b9716cb883f47e4'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
