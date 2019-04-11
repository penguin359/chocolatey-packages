$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'
  version		= '2019.03.21' 
  fileType		= 'exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/LATEST/chirp-daily-20190411-installer.exe'
  checksum      = '8124848005b116d165d69f565260c2b8118d6605ec82dece846c3f80262a7cb0'
  checksumType  = 'sha256' 
  
  silentArgs = '/S'
}

Install-ChocolateyPackage @packageArgs
