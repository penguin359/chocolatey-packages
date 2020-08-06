$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda_11.0.3_451.82_win10.exe'
  checksum     = 'a639e0c097717c5f544f7a81b7162b4cb49243a30fd892f3267bc5532c8e2584'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
