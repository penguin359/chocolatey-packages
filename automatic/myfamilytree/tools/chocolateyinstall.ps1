$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.0.0.msi'
  checksum      = '53a48d8a4cdfef3b0f244196ed1b8c26dba3047bc5e80a274be7959c7c9b7c61'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.0.0x64.msi'
  checksum64    = '24fbb1132758d6139160dd45d2fbe52834e6edbd51c171c394349ddc8f8962c9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
