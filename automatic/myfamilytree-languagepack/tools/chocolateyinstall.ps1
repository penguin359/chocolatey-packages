$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.3.2000.0.msi'
  checksum      = 'c170a040e5a0721ebd00d098cd4c67cf90e00f00546d49aa6d7cc1901e5669ac'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.3.2000.0x64.msi'
  checksum64    = '35cf06081140185cbf5bfa9a276e286b7dc0cf8a6d057c2a2c21aabfab6f14cc'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
