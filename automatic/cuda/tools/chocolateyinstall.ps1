$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_win10.exe'
  checksum      = 'd17f31f5f678585216e6ab79a6f90f8349a3cd2ebdb1d1ee73cdf3ddeb25a578'
  checksumType  = 'sha256'
  
  silentArgs    = "/s"
}

Install-ChocolateyPackage @packageArgs
