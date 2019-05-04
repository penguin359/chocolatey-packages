$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.4000.0.msi'
  checksum      = 'e4b80ba700625ac4de6555caed6db12c6d95f2b29f58b644a804ccac6cca167e'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.4000.0x64.msi'
  checksum64    = 'fa9f6f54ab211f50abb9de6e349b83c7a3387f75fdd77b69dabecfe5d1a3f90a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
