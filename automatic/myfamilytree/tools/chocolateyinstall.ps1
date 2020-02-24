$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.3.1.0.msi'
  checksum      = 'e13ab32f6fd66f0e0ae5bc3906e6c24f3a0e2e094d6e39aa0e0cf9f9b6d9e291'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.3.1.0x64.msi'
  checksum64    = 'e56fc087538f4a4bc36b5bee6bdfa66f23aefa70858c0bfc1f72e7d26fd1c95d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
