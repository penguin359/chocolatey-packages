$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucb64c27ce37088f0e36a1aca148.dl.dropboxusercontent.com/cd/0/get/A83uY80T2Quzf8Tgnt6ce4bMOeH2HOFqyNnRygLHwgn5Wge8DQtiAYs5IzyQPtczasuuNVYJLDYW4BwSDC_wbRpPv0SGpdE10kAcCVwchI8Q2f_6iqtOAZ7ZoV6YUdcrSwA/file?dl=1#'
  checksum     = 'becfc27b2783cab46ab052a9b86ae11741091e373a3d30428dad1484b3919a53'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
