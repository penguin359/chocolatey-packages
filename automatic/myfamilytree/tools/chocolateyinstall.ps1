$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.1.1.0.msi'
  checksum      = 'd73e0554d787fb5d7e96c63a7c2b29d7653438dd79da54b54089c0342aba563b'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.1.1.0x64.msi'
  checksum64    = '22503f2971a9bec60cfd4e32a0e6040cb669e6d914d0ed88a2bde87363e9387e'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
