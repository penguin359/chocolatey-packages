$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.168_425.25_win10.exe'
  checksum      = '52450b81a699cb75086e9d3d62abb2a33f823fcf5395444e57ebb5864cc2fd51'
  checksumType  = 'sha256'
  
  silentArgs	= "/s"
}

Install-ChocolateyPackage @packageArgs
