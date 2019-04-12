$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://dl.strem.io/win/v4.4.25/Stremio+4.4.25.exe'
  checksum      = '1B77D2475661629C696271367AE51614BBC9256E4AE47ACD136B2E230E473601'
  checksumType  = 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs