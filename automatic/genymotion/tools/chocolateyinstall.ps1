$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.2.1/genymotion-3.2.1.exe'
  checksum     = '@{Algorithm=SHA256; Hash=1DE2D5AB9FD28460EAAEFC8CEAF63D85F156D285B6BE4DC89FB583AB0998E6C5; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
