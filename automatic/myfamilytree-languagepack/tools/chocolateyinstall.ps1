$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.5000.0.msi'
  checksum      = '6ea78eee504c187f5597d3191c5773f6750b087f77e24a61e09b98e57f0a7b21'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.5000.0x64.msi'
  checksum64    = '2fbc77c5403abc5c0336f1eeb2aa68a2fc1eb266798a2d52d04d932a2d398ff0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
