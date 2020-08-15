$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.1.0.msi'
  checksum      = '2b248bddb5c111f16fbf06a7ef6e625084de10c2aa9746e0bb447a8f2671a4aa'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.1.0x64.msi'
  checksum64    = '60091411ea41af4f44610edc0c6a2c837b2ef9c2c36d1e96657dd2ff3cc2fb1d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
