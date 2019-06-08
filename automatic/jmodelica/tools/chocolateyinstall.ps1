$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://jmodelica.org/downloads/JModelica.org-2.4.exe'
  checksum      = '561F6ED9C0A7CFDCD76764F016B4BB28468D72D505D6C170AD9A94602743C02C'
  checksumType  = 'sha256'  
  
  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs