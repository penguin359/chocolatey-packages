$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.3000.0.msi'
  checksum      = 'd8c398eb3eae8eed6f8ed3d7a27a87376bdaff3efc44c962cfbfa12a6cd29376'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.3000.0x64.msi'
  checksum64    = 'f0521f595ab1b753e7cf41568b1b0d0a78f7d2e3964f9a45948ae6ed81d259da'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
