$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.4.0000.0.msi'
  checksum      = '5b068cbbbb279fff6c35c484e745431e88203f748edc73790b3d028f9f73b548'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.4.0000.0x64.msi'
  checksum64    = '858879e02b13a5f2c56cc46d354c1369f75e7c2b3cee3fe8e73d1c4d49f3ee97'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
