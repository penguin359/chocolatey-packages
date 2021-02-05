$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '6D725C0543F34F038230443AB8765B0E9598AE8C58437F67FA1094B50E6E0DA2B1F023338953B0E76EDED45C16852DAB19CC57594E1947EDABBC8A3DC579CE4C'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs