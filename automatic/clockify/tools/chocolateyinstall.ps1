$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '7EED3B174DC20B025D786E7B55C75044BFB4B13BE218C0F322B2471528F6F1BA6FAFF335BB856A440F0AFB04E276D3A5BA88101C63149A9F8AD658AA62B60875'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
