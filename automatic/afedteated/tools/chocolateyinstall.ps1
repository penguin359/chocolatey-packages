$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum      = 'CC8F410A941F0229B605F36454FF420984115BF96DD9E64B6CDEDBC2C9C4C9A4'
  checksumType  = 'sha256'  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs