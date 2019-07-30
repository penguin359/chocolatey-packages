$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.1000.0.msi'
  checksum      = 'f445729f1b7e7f39a44adf5f175cc6ccda8e2b7934cb3ab348f8e7d01d3ed87a'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.1000.0x64.msi'
  checksum64    = 'e3addfbd72039184019f8224062a24e32570770771605750ebb72c12afd92e79'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
