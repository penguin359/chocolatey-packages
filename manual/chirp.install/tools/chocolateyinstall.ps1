$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'  
  fileType		= 'exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190412/chirp-daily-20190412-installer.exe'
  checksum      = 'a0b042fd562835ef199ac94fea9154d2767c68764d04e0c7acbd3a35ea20c65b'
  checksumType  = 'sha256' 
  
  silentArgs = '/S'
}

Install-ChocolateyPackage @packageArgs
