$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '3FE8CC74875D9E310E6E48A36487BB739F75722372206B1D2DF0175AC1244F04CF229B0F4D221A46240524E03ABF65538360C0A2E82FC6788FAFC04CC9237C56'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
