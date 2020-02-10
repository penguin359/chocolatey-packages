$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.5000.0.msi'
  checksum      = '3ca487710ccd38f89084f796d188aa133dbdbf6588d5cbf4da1c6846ce41a583'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.5000.0x64.msi'
  checksum64    = '155214504be0c0d683c365dd677d9c9d48f231b29494ded710da5444b9a7c401'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
