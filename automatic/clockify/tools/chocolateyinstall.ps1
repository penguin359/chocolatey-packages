$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'E27E5AD7C45AD1854E9565D11C21DEB25E6B8030D229C939774FCC5436D733DBDBB3673F9AECF90330E52A823B0E69054D893E4DDC64668355619F2C7857D37F'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
