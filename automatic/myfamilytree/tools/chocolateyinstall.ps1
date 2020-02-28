$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.3.2.0.msi'
  checksum      = 'e5c6183b9505555e7fb6670e75e2d963ff4f79460d71808c5308f78a90d887e7'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.3.2.0x64.msi'
  checksum64    = 'bee9eefa23698f7e64dbcfe2e569599b8f280bb801c02d4129285bd24cb72ffb'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
