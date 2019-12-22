$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.1.2.0.msi'
  checksum      = 'bd0d0a859b4eedc2a3d4f055a0b415be3839624fd6896bf41c1d0ce5ac0ee46b'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.1.2.0x64.msi'
  checksum64    = '1b26bfe1f2b902292376a27b66fd4103412c5f3aa5960bf14d0c7078af817a28'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
