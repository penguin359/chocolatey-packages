$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '1F905DF2525CC1BE66A80A489B0C0E0614EA8F30105D8D9DE573BC799F65B10FB0FD0F0C0B0D5F99BDC83E5E1AFB0A90735595FD5D989C3CC28ABECBE963D33B'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
