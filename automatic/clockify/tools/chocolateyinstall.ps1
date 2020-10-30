$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'A0A1D41404F4B445BF2335F88D479EDCF16E5382F75EF27D08415B7D1E745A9F68D4C939E641FAA4601D1DD06CBFC6488CDB781B7975641D16CE9455E0CCFCB0'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
