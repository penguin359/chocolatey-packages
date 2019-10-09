$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '46E4E688C3BE3BF521D9A85DC7DE2A5E0713B86C580054EA900DFD4C79439E5544E89831D1D91C1E69C7310A8C1B83ADC0FA6714F0F7A212EEC67F28FD50BAFC'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
