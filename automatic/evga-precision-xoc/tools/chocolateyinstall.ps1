$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://storage.cdn.evga.com/software/EVGA_PrecisionX_OC_Setup_v6.2.7.exe'
  checksum      = '69FA087B204FE70635ACD81F3AC9CAA1785CC91E6B5F1411C1D2C13DDC2251EF'
  checksumType  = 'sha256'

  silentArgs	= "/S /v/qn"
}

Install-ChocolateyPackage @packageArgs