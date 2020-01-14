$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.3000.0.msi'
  checksum      = '29f6be3c3286b619124bfcefa3d6b3bbb842f479dc4300c6883ca7f8ac39bd83'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.3000.0x64.msi'
  checksum64    = '1ea0bf384e7e44f29b09e9daeaa50f6544a744f7707733c4e77c16eb3683ea57'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
