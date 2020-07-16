$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.4000.0.msi'
  checksum      = '15e6c7d800b8b41f821a081104bb631afca5b917204982861bafc97af10e8b3d'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.4000.0x64.msi'
  checksum64    = '4a8f9245dea5529ca39d6dc2ac10e96cd0819f5ca5067f8d1a3959393343785e'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
