$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.2.0/genymotion-3.2.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=2A4B6C6C4989CA7063D4F4564DABB454D1D7BBE6D5461491B4F04E1455004490; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
