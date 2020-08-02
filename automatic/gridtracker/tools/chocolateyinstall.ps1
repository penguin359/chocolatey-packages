$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucc203448be4e9f5fc58ad024adf.dl.dropboxusercontent.com/cd/0/get/A8qVNYzAggpbpmCTRAO1cp_o2IGR3zccm-FN2meZkcITGpGvPgg5S2v7V5zMrsXWsycq8a1FhemGPzLbyaNZIBXREI1Z1Ct3Lly6a262SX9pBpulMk-jFYNNgLQILuUOgtQ/file?dl=1#'
  checksum     = '91085d6bf5ad5952513dd7a3e6b0fb8d46cc52cda03aed445c2c553f82170aea'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
