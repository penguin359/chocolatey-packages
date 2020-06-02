$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.2.0.0.msi'
  checksum      = '1982ae5d0fe59567f3564db35ac2c7110655c75f97fa0542681c8c3ffef2cffe'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.2.0.0x64.msi'
  checksum64    = '197b6541b48d434757e9ce5705e868765cd19d7ce83fbd702c7d69fdd0ea8563'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
