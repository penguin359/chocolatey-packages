$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.0.0.msi'
  checksum      = 'd8f6f3edf0775a28bdb8fdcd91625da1aa3d332e91fb4edd37ec8ee8b8df99cc'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.0.0x64.msi'
  checksum64    = 'c632fd80ba33111aa5748242d80ba0aa514a9060050020dbe19223b88852cdcb'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
