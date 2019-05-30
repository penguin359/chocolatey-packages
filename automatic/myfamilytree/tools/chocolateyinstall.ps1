$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.1.0.msi'
  checksum      = 'fbf5deb1d90cdd4b677549f6e65a401de28fa1d3489c6b9ce1f8753d7e3787b2'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.1.0x64.msi'
  checksum64    = 'd3a6183d00d4ee9c653964c8495a80c068316d9f3a3486edb736f3c8a8de398b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
