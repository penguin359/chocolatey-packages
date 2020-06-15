$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.1000.0.msi'
  checksum      = '878a3993428d18bf7b56904d9078d9f37a36df0adda51e99aceede1536d3306b'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.1000.0x64.msi'
  checksum64    = '97322b6437a616448f0e7b4dfe4401250701f7b4e6d22d9053992babeb0d21a4'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
