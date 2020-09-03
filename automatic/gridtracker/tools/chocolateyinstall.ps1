$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc01049816f7c18402ae8520d0b9.dl.dropboxusercontent.com/cd/0/get/A-qI2gKY1liO7eWrhgKxG0las3yewdp1y1szxkzblZeZHrtXkESqn-wVUjlUEi2soOgk4z1NBi9dAGOW2_uRfTU64T_WeNSCgcGCRpjG2OYdtpEPBBlPWVYXiJA7c14laUM/file?dl=1#'
  checksum     = 'bf3b388ba9578ad404934a8b53053f2e186390fd4dea79dda02acbaee8235f22'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
