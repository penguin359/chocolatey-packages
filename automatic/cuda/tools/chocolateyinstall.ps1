$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.89_win10.exe'
  checksum     = 'da1dc049663a82fbf4d046337d5660f9dd9e2f58d50a619dec1ad49a9ddb614b'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
