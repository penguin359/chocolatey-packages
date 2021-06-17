$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '93625BE289AAEF410B7273E50DD5DB4AAB3E6D0E4A2DC67B199AD78516A9334B063EAB0CF71E115FCE7DB48D1AC47584FA6429560271EC19CDBF268CA8DE08EF'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
