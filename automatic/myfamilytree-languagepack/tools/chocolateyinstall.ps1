$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.0000.0.msi'
  checksum      = '070e893bbf93da8c9d5df6bc110d3e5961b83b9e512333a16a51a50d1a642285'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.0000.0x64.msi'
  checksum64    = '1278a437844d6bfd680cd3519d2ead72a1135a64ea679959f48389835218edf0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
