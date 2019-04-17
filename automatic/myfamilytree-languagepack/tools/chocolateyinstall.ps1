$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.2000.0.msi'
  checksum      = 'e7b2d930b07ad6c1a3647b383bffe0248052e4dbadca7f2b014aa3fe98c4c421'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.2000.0x64.msi'
  checksum64    = '59e5847aaf587feaa9fab4c40133a33b2e30d5382ae714e6bd5a2b23f57f27fb'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
