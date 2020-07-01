$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.1.0/genymotion-3.1.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=78346E6023AE85709DDB2D707766D10EAE72F8551F07768D8EE00106AB41DAA0; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
