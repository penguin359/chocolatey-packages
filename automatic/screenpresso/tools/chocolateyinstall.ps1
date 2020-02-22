$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://cdn.screenpresso.com/binaries/v1/Screenpresso.exe'
  checksum     = '5FBAEED37029D04DF451338CC013D57ADD5C5BEDFCF4C941FFA86BDD680F37EB'
  checksumType = 'sha256'
  
  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
