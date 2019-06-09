$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.2.0.msi'
  checksum      = 'd54902b497b4697cb4be1b6f82cf85a016724038e3bf0b0336635b247fc761ed'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.8.2.0x64.msi'
  checksum64    = 'f437f54be0628c094c934b3bbd8b9f819274cbcd504a7fff53281d3a0ce12b7f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
