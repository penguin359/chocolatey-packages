$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.5000.0.msi'
  checksum      = '1daf8f2d6eaf0844d5eab999fbfc50eb57c1420f5effcfae0123845604d221e5'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.5000.0x64.msi'
  checksum64    = '526a836fd3a7c9ec0c175ed1e45b8ec0359b25013dee0b0e0f2822724407a4c3'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
