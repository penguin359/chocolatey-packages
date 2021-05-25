$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.5.0.msi'
  checksum      = 'a44c7e8bc7500f1a29cb45f05345d6d407fb8d77972414fbc02e0a3b12eff469'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.9.5.0x64.msi'
  checksum64    = '2a032a34c597efeaa1bd96c8ccb1f92337c718a551c2fdfe26cbb6d664c4b19c'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
