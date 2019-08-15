$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.4000.0.msi'
  checksum      = 'a2457645520b5064718670a3b646f734c4a79797367549bb05ef4095c452658d'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.4000.0x64.msi'
  checksum64    = 'c3b4377aded7604d634d3f02c002b9e54b25cc39c972823d7f80d0eb6f33fbe4'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
