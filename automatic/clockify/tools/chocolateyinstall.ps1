$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '3455B0E259959211DEB7D04F104370F098938D45DE6C3F2ACE7FF476C8C6C9D75C7CE33B7E12E623E8BA7BEEB8B121D8EAE3783AF9565CFBEAE6DD17D2943EA4'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
