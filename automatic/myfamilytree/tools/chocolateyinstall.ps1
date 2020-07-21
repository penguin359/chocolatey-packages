$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.2.5.0.msi'
  checksum      = '19c5049f2c19277312b40a784e11533e6e47f3f3f1ff4e6dffd3a3a7858bbe5f'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.2.5.0x64.msi'
  checksum64    = 'f1bb3b1301eb498630a77ad1ec7ce2fc2158ecc14e970fadb271944009258e63'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
