$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://dl.strem.io/win/v4.4.77/Stremio+4.4.77.exe'
  checksum      = 'd5e1f5c638d99e17090762585022b649bd71e1c684044f64a55d96211cfef2ca'
  checksumType  = 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
