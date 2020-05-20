$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.0000.0.msi'
  checksum      = '4402c69e8a49d8b6f573b21a406af12fc6759ba7e070a4834db2bad14024fc25'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.0000.0x64.msi'
  checksum64    = '97bbf3c41f68913434f5d7a2b7dc6a9d265afc7708a1940a84a8c8d61296a995'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
