$ErrorActionPreference = 'Stop';
$packageName= 'laragon.install'


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://sourceforge.net/projects/laragon/files/releases/4.0/laragon-full.exe'
  
  checksum      = 'D8718426A5633BD279BB1C7F18E1CC80D63F840D7B38C04ED47F41764A054403'
  checksumType  = 'sha256'
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components="'
}

Install-ChocolateyPackage @packageArgs