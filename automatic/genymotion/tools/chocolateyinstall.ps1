$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.1.1/genymotion-3.1.1.exe'
  checksum     = '@{Algorithm=SHA256; Hash=4821B0ACC7938520E3FFAFFEB78E83DC5E9761A2BDCC3F12D6CCDBDCE1783FD4; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
