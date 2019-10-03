$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url          = 'https://my.powerfolder.com/dl/firSoD3LMSiXaonvfcs2TQf/PowerFolder_Latest_Installer.exe'
  checksum     = 'a37c5bb732b22e87ac68ce0e1103a6496e5574a49a10b55005d33cb714499970'
  checksumType = 'sha256'  
  
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs