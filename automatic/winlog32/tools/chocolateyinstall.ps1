$ErrorActionPreference = 'Stop';
$packageName= 'winlog32'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'http://www.winlog32.co.uk/files/wl32v73.exe'
    
  checksum      = 'ACF6D13E5EE1314DA38401E91AA6E5182C7ECB6C7C5013D9375B500C36FE3A2F'
  checksumType  = 'sha256'  
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs