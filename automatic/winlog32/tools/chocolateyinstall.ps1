$ErrorActionPreference = 'Stop';
$packageName= 'winlog32'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'http://www.winlog32.co.uk/files/wl32v73.exe'
    
  checksum      = '860069340fb5f1bde2db2964770c29a37404cb3223b5c202dc19d1d2df99a7b5'
  checksumType  = 'sha256'  
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
