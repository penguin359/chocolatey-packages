$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum      = 'f7f8956ab7114d1d9b0a3b4b02b4e16214cfea495a62796c31b4df5c487b1243'
  checksumType  = 'sha256'  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
