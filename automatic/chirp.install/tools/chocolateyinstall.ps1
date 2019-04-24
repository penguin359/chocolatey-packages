$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'  
  fileType		= 'exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190424/chirp-daily-20190424-installer.exe'
  checksum      = '08740562681687a8d88c95e4b4f0d999afccc46894801dee93d5ab4215bf183e'
  checksumType  = 'sha256' 
  
  silentArgs = '/S'
}

Install-ChocolateyPackage @packageArgs
