$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc1927bb7d08580c43aae492a403.dl.dropboxusercontent.com/cd/0/get/A-gNqgKMqDQFsl2Lfs9vKmolpi_GMmcDIT98QHPUGWOOGT2eeSVRT8ahVSw2KNJ0bwCGN-FTh7kQM-EQdUxj1rhFiRfYilWk5Ay7XJXwhzAwEe1omE5VuPucrD_ZJGKQnr8/file?dl=1#'
  checksum     = 'd3f2c95352f5095406e6fdf37e008057ddd0b29e33f42319d18cbb9d7b60e152'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
