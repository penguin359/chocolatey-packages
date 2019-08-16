$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.5.0.msi'
  checksum      = 'a4cfdeff83aa34d1ec970fa1a3edeadcfc40c39ba3987e7dc9d2d9a9baad549c'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.9.5.0x64.msi'
  checksum64    = '2ede9d61477e56c758134f2c82d4434318f890693b36c0dc7257f3b58d866fba'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
