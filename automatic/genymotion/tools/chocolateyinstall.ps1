$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.0.2/genymotion-3.0.2.exe'
  checksum     = '4e6902c1be6e7f019dc0b3dcfd5ec87e36ed4c81bae5ec52a06a2671d5118767'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs