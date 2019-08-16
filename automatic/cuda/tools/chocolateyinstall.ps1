$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_426.00_win10.exe'
  checksum      = '35d3c99c58dd601b2a2caa28f44d828cae1eaf8beb70702732585fa001cd8ad7'
  checksumType  = 'sha256'
  
  silentArgs    = "/s"
}

Install-ChocolateyPackage @packageArgs
