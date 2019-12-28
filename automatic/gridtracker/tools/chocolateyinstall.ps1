$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc396a2b688fc2ed1550ef224389.dl.dropboxusercontent.com/cd/0/get/AvH_fjjURIpEekxIqhHBofeSXGmCbZkxJBynYLbKEXoMjaE2voPMi_vQNTWbCMuOHPtodM67WT7c-Yrv9SrV5qjGHYqNRr_Q6Eyl_-dbFb98hezoazpPgy51eosEhpokJuE/file?dl=1#'
  checksum     = '036eeb2c873f4ae621a3ce3270d3e7ec30ea282883219b4f3d155000536433e6'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
