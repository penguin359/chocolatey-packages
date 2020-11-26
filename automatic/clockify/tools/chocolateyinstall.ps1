$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '5FB9A15B019F43A9EF4EC33D25026AC4DA22DB4D6F306C53E48B2C105541A563379DB2FC91AE4E8C22A02CC525F9D411F88E4AA18C6C26145B1087CDF79147D0'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
