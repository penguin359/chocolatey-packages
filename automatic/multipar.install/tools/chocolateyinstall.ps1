$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1304_setup.exe'
  checksum      = '818C7E9C5FBB7F02623978734BA3A998B0A66C5B5C0A8C895011BBDF7AABAECF'
  checksumType  = 'sha256'  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs