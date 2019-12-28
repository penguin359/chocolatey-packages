$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc396a2b688fc2ed1550ef224389.dl.dropboxusercontent.com/cd/0/get/AvH_fjjURIpEekxIqhHBofeSXGmCbZkxJBynYLbKEXoMjaE2voPMi_vQNTWbCMuOHPtodM67WT7c-Yrv9SrV5qjGHYqNRr_Q6Eyl_-dbFb98hezoazpPgy51eosEhpokJuE/file?dl=1#'
  checksum     = ''
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
