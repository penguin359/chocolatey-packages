$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum      = '607A6BC946BB0E723BF774A4302FDB330A72918DB16C0612D234BC527EDC8796'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs