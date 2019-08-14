$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.3.0.msi'
  checksum      = '7dc2ca8691f43448a008cb0744c56d44155a7330465b5ce3ec2ca825ea3ec369'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.3.0x64.msi'
  checksum64    = 'a5902713b9a13bebeb20f0202b516fe0d21a69088a86101e61fdb89915d62dcd'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
