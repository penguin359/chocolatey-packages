$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.0.2.0.msi'
  checksum      = 'a2d7fec72ca13452b839360a82ab84529dd2e9a1cb06670d25a3dd45f8411eb9'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.0.2.0x64.msi'
  checksum64    = 'e8eeaf5b12c1eebc6d9c2fd97ddd7386566e7a842641e38dc5779e79f6fc18fd'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
