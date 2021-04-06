$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.2000.0.msi'
  checksum      = 'b598fdeb4da671a73ef1eca0424d52402b027bf8b3a81052847e323abcaf1f8c'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.2000.0x64.msi'
  checksum64    = '1cdc25eb61c4061816f048bab487029ffcd9c07a99ca9169ec43cf252c0ebd0d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
