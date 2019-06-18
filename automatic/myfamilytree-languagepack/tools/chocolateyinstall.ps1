$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.4000.0.msi'
  checksum      = '132ac0fc926fff6bc0c1c132a9a7fee7867bf420d130bd11ca2b2a7e077e8d85'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.4000.0x64.msi'
  checksum64    = '93406a49f520b3286423225a583c34a3264d3279655e99c7b83703a7543312fa'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
