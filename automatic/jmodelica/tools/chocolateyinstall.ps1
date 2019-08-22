$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url          = 'https://jmodelica.org/downloads/JModelica.org-2.10.exe'
  checksum     = 'c790934c761502e0c06f39148fe11ee2341173e680559ef0349df4a0b23fc627'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
