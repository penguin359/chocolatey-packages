$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc79f7ffd1a8cd043a1e11fc582b.dl.dropboxusercontent.com/cd/0/get/A95eCEXOl2Xt8S3FGva0vm-xA-9WRQZyK8OIAiVMGanp_5AGMbyxhn2T5_csuwx9nKKQqwtdrYqFYtvLdMWMnFI1DyNf5So6juI7FVcrYJwek27HhF_N8uyC92PoIBynGrY/file?dl=1#'
  checksum     = 'ede898f4dd4db540a2903c23c837e02a25cd807b128256eb21fcaebc0e1593c8'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
