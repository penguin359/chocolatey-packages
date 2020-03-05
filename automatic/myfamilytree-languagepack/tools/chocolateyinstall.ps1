$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.4.0000.0.msi'
  checksum      = '2d2159bc82cea0c34b14771594ce3a0fb75dd83cc1b7a712ed686902090f59af'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.4.0000.0x64.msi'
  checksum64    = 'c505dfa9b8a24855d8c6871350b098f0a64298db70d1540cd8addc1631336180'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
