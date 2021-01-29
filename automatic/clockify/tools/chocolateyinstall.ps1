$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'A3D3936B351DA8A812335ADA8532BEC3CA30ADECE063AD5C3170983399E87E893AF7E5FF3C7A18BF1F937355A11E3A9150E2631D657D816AEFF8BBFD03377C76'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
