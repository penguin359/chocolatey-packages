$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'
  version		= '2019.03.21' 
  fileType		= 'exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190321/chirp-daily-20190321-installer.exe'
  checksum      = '4ED1121C1BC7A532D6F047955B96735D13AD892F8A53946EA678B7AD7A87FC5A'
  checksumType  = 'sha256' 
  
  silentArgs = '/S'
}

Install-ChocolateyPackage @packageArgs