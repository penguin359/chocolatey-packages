$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.4.0.msi'
  checksum      = '6fedcc6d6db4e80c3890eca2ff9877907106cd3117ab06d99b4d7da426336eb0'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.4.0x64.msi'
  checksum64    = '72d9fc22388489d8a474ac177e27b7e6a5e6544e2801dd32bf77c9adfe541785'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
