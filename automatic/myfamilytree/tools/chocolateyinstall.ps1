$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.4.0.0.msi'
  checksum      = '981dbca3c8f6980baaab2f53766e4f1b0bd332d5c6b76ab22de372e573a41317'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.4.0.0x64.msi'
  checksum64    = 'e2ce7e39b0ea9d03259ad2b9244ba1dbc7ef2d3602059353765ac10e627c7a93'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
