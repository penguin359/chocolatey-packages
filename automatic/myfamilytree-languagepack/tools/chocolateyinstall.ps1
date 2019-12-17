$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.0000.0.msi'
  checksum      = '905fcf267e41c989c01bc1125f6b78a06aef8f3d88127785dc2e45c425d631e0'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.0000.0x64.msi'
  checksum64    = 'ffaf806c21add390f8d66871f3be44772afee83fb9ca6a5fcc989977a9c7e081'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
