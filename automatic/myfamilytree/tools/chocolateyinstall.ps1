$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.1.0.msi'
  checksum      = '8cdf25aeffc99c83048e7833ca3fc17c8b8d67d5e2ac1fb96a3f98fc85ba60e1'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.7.1.0x64.msi'
  checksum64    = '3c47dbdc0c7217219b18a93a6d915aca0afdbfa7beea08dd4d26e09b65316635'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
