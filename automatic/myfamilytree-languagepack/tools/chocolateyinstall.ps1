$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.5000.0.msi'
  checksum      = '76fafd1f1bd60d3efa62e36b848680be3cafd45e60817ae4610f3973db6ffcf7'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.5000.0x64.msi'
  checksum64    = '6339f84228286c574a62ca46be6915dcc8fcb1efe766eddade825f78a562fd63'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
