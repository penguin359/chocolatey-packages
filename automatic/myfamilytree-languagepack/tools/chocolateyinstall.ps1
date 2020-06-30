$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.3000.0.msi'
  checksum      = '780ccbbe3c9c0cafdccb1529892bc6f904971ec28fbed3ead8fcb4d741c054a4'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.2.3000.0x64.msi'
  checksum64    = '32a50cd2438b675710b07d4e98deb0dac4ed2754766816c956806d3b0c86acbf'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
