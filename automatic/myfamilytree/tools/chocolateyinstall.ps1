$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.4.0.msi'
  checksum      = '259a7d8bbb24aca41930bb686df3553ce4252d45d93f394f65cd7cd238ff80c9'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.4.0x64.msi'
  checksum64    = 'd15cdf02f1863ae6cfbb9338eaed8ee2305bc7a41872b6015378502d198f53fe'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
