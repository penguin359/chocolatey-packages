$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.0.0.msi'
  checksum      = 'e70e19574addf24448c6c3921d0cb6bd0fe66942161f0ebd317162cf88dd5a68'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.0.0x64.msi'
  checksum64    = 'a3dbddb78c7874d5b27ab6f80f0c7cc055385269069eed154b7e6efe4c7c7d9d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
