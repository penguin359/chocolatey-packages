$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.2000.0.msi'
  checksum      = '62bcaefbbc6bec9cad0fb59f2ba2470dbf85c980f906360f8b011f8ef8757b3a'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.2000.0x64.msi'
  checksum64    = '5cb53f3943b83df1491199a6444a0afb45fea6786e77e42f663f308178730509'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
