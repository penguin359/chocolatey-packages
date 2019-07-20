$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://altcopy.net/setup.exe'
  checksum     = '9BDEE97828744F724B362907C0B16D170B45F374AE173F5289C2F8307042349C'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs