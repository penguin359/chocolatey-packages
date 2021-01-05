$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'E9FB0BBA1400C6A12F6AE4B982E2A540603C780C855E03F2FEA71565E74BAC0AEB00C497A132857E7B4E79266D3FAD2FA0DB58E94F280568C2B5303E7B602AB0'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
