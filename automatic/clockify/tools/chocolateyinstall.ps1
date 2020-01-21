$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '1E3E459BA1210C34B436080C9E802A8E015FBD7AC1300ED90F20E9651B1A66D179F93DF849A5B1707AE538B769C6E2AA40254DE68A653B799D03EFD836B0CEC0'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
