$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.4000.0.msi'
  checksum      = '00287a60fb6955035ca18c0138140716f4b161f43e7abbdea66a55f0f1e56ceb'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.4000.0x64.msi'
  checksum64    = '81cec410353bf28afa54f8263f10abc4a7d17e7a3b6b6ea9f7a15f108e52205f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
