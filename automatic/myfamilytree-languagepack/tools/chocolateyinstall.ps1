$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.4000.0.msi'
  checksum      = 'edee6b6f1b219b6e6557c5b9f18ce5afc65c40565a8a22d39404a5a51a336eec'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.4000.0x64.msi'
  checksum64    = '0e0550b5352cc02745aaa71200a8995e90d23198d1fb296e4fc41209cbc9b2b3'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
