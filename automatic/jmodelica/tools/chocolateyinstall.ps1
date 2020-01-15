$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url          = 'https://downloads.modelon.com/download/?a=JMODELICA'
  checksum     = 'f4d4fce582d01230f7546d2fe64c0588433ddfd0633d35e88d984f5cd1dca181'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs