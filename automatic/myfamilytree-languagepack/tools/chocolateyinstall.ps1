$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.6000.0.msi'
  checksum      = 'c9c987d1e4ee0ffcdcc5372efe0bab33717f450ff8f25e6a9d60259e4d5fedb9'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.6000.0x64.msi'
  checksum64    = '193dd120fedc1e98fdced4307dc363394dab68e9050444b9af9383f7664c4c2f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
