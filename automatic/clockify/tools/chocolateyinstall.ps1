$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = ''
  checksumType  = ''

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
