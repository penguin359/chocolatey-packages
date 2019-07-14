$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = '726C66BAE152FA53F4F4412891FD1852DC197C35839D676C4921FE1380098BF0'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = '731B6E728AEF9D2FDB85837CADC93E33618829CE2B1CB8791B0B0515F9B2F527'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs