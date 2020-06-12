$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/11.0.1/local_installers/cuda_11.0.1_451.22_win10.exe'
  checksum     = 'f93f4ecc29d9f24e95ec9899677118ce8007d143cc4ffdec9ac68d6a81757bfa'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
