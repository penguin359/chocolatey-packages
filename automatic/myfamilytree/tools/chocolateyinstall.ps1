$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.0.4.0.msi'
  checksum      = '64eac0fec8f33d2828dc6a723379c54eb7625cb5ce75159207b6419552f52559'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.0.4.0x64.msi'
  checksum64    = 'bf3a8d9b604bddf98ff75431d73327883a5bb41b5a94e3bfa8e31b403a8f6ae8'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
