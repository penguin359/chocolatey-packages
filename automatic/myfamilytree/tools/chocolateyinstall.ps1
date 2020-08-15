$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.2.0.msi'
  checksum      = '2c9150a3c4bf621f473a7068c2b027eb73ed1d6c0fd4a550a9ff79259ded14d6'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.2.0x64.msi'
  checksum64    = '8db28f42c7cd8910ef52f9f0c1c4b4e2fb7894c6999afbbf7c8a337dbb1b15fa'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
