$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.0.1.0.msi'
  checksum      = 'b29a94658f196140f6a976ffc6aa195e9aa484ba3e5557ef890c58a8181c2431'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.0.1.0x64.msi'
  checksum64    = 'dbf5ef69687d14bb310979206168717b7bbbf19489367b34b3526c4a3b5563a7'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
