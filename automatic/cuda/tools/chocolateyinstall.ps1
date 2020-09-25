$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_456.43_win10.exe'
  checksum     = '759b6cc5d24da6a4a49fc708d7d37b164918433ac59248ae31c7e95bc8a2e1d5'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
