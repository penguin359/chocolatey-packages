$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum      = 'b5556e18080850d515c8db52be16dbd220b873d51f7cffc213f1a914a3a7e293'
  checksumType  = 'sha256'  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
