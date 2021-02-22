$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.1.0.msi'
  checksum      = 'ab0fa52ce4b5b0746a51edb0f6e182b4e3495a9f315b44be50beea02077f82e5'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.1.0x64.msi'
  checksum64    = 'c685fae433245427d3919f0d9ba565167554d9ddccb7a06d2c49dc67ba871b53'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
