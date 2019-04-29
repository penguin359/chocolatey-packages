$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'  
  fileType		= 'exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190429/chirp-daily-20190429-installer.exe'
  checksum      = 'c82d67d0c0600b07d11f5894573aa0630d06d7c2a779e5c41a316a2b5990aab8'
  checksumType  = 'sha256' 
  
  silentArgs = '/S'
}

Install-ChocolateyPackage @packageArgs
