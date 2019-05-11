$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1305.zip'
  checksum      = '8cbcc49e7034bf2b5aae35378e9173e68c03adc269fb2d0a6eb2b2f87d97c7a3'
  checksumType  = 'sha256'  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
