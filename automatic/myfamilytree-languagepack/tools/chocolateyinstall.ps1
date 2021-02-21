$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.0000.0.msi'
  checksum      = 'eae879f0be3886d81ec185fca356e66b84556fa1c04dcdbfc41924fe904f5590'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.0000.0x64.msi'
  checksum64    = '14b59e05aa8e000c0ef7706127ef8c387738e68e0b3c5da85deea03a76de6810'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
