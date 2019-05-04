$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.96_win10.exe'
  checksum      = '7D32FA1A133308947D3FF61805FB3D6337AC6344A2DC4E7AFA3FB2C5F84E7E11'
  checksumType  = 'sha256'
  
  silentArgs	= "/s"
}

Install-ChocolateyPackage @packageArgs