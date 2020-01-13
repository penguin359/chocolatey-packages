$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.2000.0.msi'
  checksum      = 'ef35587bd9d225e6cc4cdcf2e27550d337ef5e854c0d5500b5eceab33e852b30'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.2000.0x64.msi'
  checksum64    = '86517f7f3eacb32de4412110f92cd8173d9f802e6bd0ef73419576d68a17246b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
