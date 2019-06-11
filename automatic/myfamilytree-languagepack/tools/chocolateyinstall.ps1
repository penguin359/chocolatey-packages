$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.3000.0.msi'
  checksum      = 'd3e8ef9eb7a0502b6cd6c55fd6057cd52d5153bcb1c8436e2d2776dae103a1bb'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.3000.0x64.msi'
  checksum64    = '2f1df4c0fddb161d99be7addbe181c715da5be12d2fbf667367a719a0da57617'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
