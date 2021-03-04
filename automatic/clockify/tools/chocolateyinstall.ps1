$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '8B9E140F6BA567EAAD8D9318DD7FC8027E0D8AF1CD3920BD9DA0E99CD92B7365670D1ADF716B5074731C80402E9C1A5EBC8932C227266E226BE0E61E963BB761'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
