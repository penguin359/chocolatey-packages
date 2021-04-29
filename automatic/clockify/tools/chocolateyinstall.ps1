$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '97FE0C3F63C0C23AB9723F39929CA1FFE6DC8A745AB1028297E3A06C9DA1B306CE6B4B18731EA33599EC43EE3A03F2D0E77EDD2E4F137D1B86FBA833AFF2B7A1'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
