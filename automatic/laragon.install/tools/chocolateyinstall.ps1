$ErrorActionPreference = 'Stop';
$packageName = 'laragon.install'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'https://github.com/leokhoa/laragon/releases/download/4.0.14/laragon-full.exe'
  
  checksum      = '5bd292cacabee81f0606a2527a7f543cc42ecc9970ec0cce5a3cfe44701c78ef'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components="'
}

Install-ChocolateyPackage @packageArgs
