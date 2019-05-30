$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.0000.0.msi'
  checksum      = '0785c0addaf3d3c79ab091f1a6c4f33c390b286758ea7e20367f18d4b0c8f37e'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.0000.0x64.msi'
  checksum64    = '9e7f6fdfd8f92201936f73a310f851d73183c67876a4c37eb9ad416df131a985'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
