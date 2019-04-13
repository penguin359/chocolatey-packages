$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.0000.0.msi'
  checksum      = '8849a3dd3de7b46061c0ddef4dbb487010cf1060acbd556954e1ecdcaca7ef9c'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.0000.0x64.msi'
  checksum64    = 'c40cd5d2d5392cfb6d9c4fb6ad4a7ae8fc4a69b9287f7ae74a4f2481be73ecca'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
