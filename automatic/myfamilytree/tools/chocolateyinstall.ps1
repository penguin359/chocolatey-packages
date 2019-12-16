$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.1.0.0.msi'
  checksum      = '11c4c22017d4828811dc494610e0c5c14bdf43fe36115962677793758336a3ee'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.1.0.0x64.msi'
  checksum64    = '0ae91d6cf7c5c5c5bba654aa6e48a314afab8089f0b3055428684c0fdc1e2ae3'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
