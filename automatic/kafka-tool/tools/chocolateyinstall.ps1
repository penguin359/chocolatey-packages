$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = 'f5dc6b9fe17c6ab6fe3e3d39109689824edd276401e45b19ba5d1ac52597e4ab'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = '3ba44d11b15172701c3c9e398dbe78b2427813ea647d97300ec80c884dc5a97e'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs
