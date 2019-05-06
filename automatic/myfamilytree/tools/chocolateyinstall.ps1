$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.5.0.msi'
  checksum      = 'bdb98bb1840e070268c1ed27592db4985b7d98cb4b0dee2d91fc5fa0ec9596cb'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.5.0x64.msi'
  checksum64    = '162504260f2f305384caa22e69d3ee1df743a8318b0a8fcd231d3aa1a0142da5'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
