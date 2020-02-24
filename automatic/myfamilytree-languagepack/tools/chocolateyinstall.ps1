$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.3.0000.0.msi'
  checksum      = 'daf902290c0ed446000ac750693c80156af9018a208441d8c97a8700a06e4944'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.3.0000.0x64.msi'
  checksum64    = '8e3df97e1cea008ae18124b7a4f3d7f2433f2f2baf279dd0f07c62d7f3f3b836'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
