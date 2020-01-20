$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.4.0.msi'
  checksum      = '92fc989c82a9c83e5f55902a80fc72e10f926a8bcdfe977971b04b2e0bbb8bee'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.4.0x64.msi'
  checksum64    = 'fd99b3eb556ea067d13c4c012b90ae030d8ac40ed8db3dcb8310973fb516679b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
