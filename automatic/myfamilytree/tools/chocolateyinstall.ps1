$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.6.0.msi'
  checksum      = 'bed5a459120aaa5d5f9edf2f36c1253b1cd8f62a2756c3863324463b0b49c825'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.6.0x64.msi'
  checksum64    = '123e376ea7a073dc6b78eb4b4dd27c50a24f9b98f15bca366455ca788e0e37f9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
