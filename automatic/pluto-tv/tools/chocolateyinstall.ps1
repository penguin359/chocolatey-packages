$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://downloads.pluto.tv/desktop/electron/0.4.2/win/PlutoTVSetup.exe'
  checksum      = '514CC6B5847E27B9AC7605117A4BF1508022450E0358F8B4FA1F5F395139FDBF'
  checksumType  = 'sha256'
  
  
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

Stop-Process -Name 'PlutoTV'
