$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.0000.0.msi'
  checksum      = '78d05e38eb415e3a31621a71002e2c5710dc4298991fec99da3a6bde67468de2'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.0000.0x64.msi'
  checksum64    = 'ad6f4822ff62888daabd4bff4373d4476631a65a7ab50c3a802bf5a649de043f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
