$ErrorActionPreference = 'Stop';
$packageName= 'winlog32'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'http://www.winlog32.co.uk/files/wl32v73.exe'
    
  checksum      = 'A434B4D9A9B3D7634705359B8A92CD276F669BD5DB0621DCD2108A9F88E59D60'
  checksumType  = 'sha256'  
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs