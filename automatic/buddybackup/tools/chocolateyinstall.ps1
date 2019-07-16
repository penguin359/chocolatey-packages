$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://www.buddybackup.com/download/BuddyBackupInstall.exe'
  checksum      = '842518F829FC7A5D488624554B20A13CB9DCC29F25E17E8076FB2774BA2AA273'
  checksumType  = 'sha256'  
  
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs