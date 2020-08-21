$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.3000.0.msi'
  checksum      = 'f3fe71ddbdaf5b5b0b5148b94139f499276ae980d75526ee80824077aab4f715'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.3000.0x64.msi'
  checksum64    = 'c60019ae075a8d548a3429c8d358bd75a4985ac9861b4fc23a072c2603ac91ec'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
