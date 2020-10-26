$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '49058C69E06DA371E35EADB812ED572083CE993A6CD8C3A8490120CE3856F4FB6B962D050300FE4E54088A673199DCFC5C3F445A61ED275900AA5F13F897B461'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
