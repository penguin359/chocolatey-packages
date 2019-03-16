$ErrorActionPreference = 'Stop';
$packageName = 'laragon.install'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'https://github.com/leokhoa/laragon/releases/download/4.0.12/laragon-full.exe'
  
  checksum      = 'd8718426a5633bd279bb1c7f18e1cc80d63f840d7b38c04ed47f41764a054403'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components="'
}

Install-ChocolateyPackage @packageArgs
