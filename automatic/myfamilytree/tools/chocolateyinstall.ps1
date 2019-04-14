$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.2.0.msi'
  checksum      = 'fd278fca021c4141abd7e9a9faa8a3dff8820c4f6c7f2998bb3592ca5cd62352'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.2.0x64.msi'
  checksum64    = '6535946f2d57b03154be8e926d02fbfcfcb778b2b274de187e4b76be6c680d41'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
