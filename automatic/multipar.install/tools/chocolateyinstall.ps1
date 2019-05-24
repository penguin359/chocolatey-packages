$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1305_setup.exe'
  checksum      = '98207E8F0E1011EAB4E9E0947F3ED6AA09E28EF92EC62C2786F89D1BE96C606C'
  checksumType  = 'sha256'

  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs