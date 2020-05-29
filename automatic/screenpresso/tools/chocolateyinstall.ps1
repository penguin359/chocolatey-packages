$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://cdn.screenpresso.com/binaries/v1/Screenpresso.exe'
  checksum     = '5fbaeed37029d04df451338cc013d57add5c5bedfcf4c941ffa86bdd680f37eb'
  checksumType = 'sha256'
  
  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
