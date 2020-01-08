$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.1000.0.msi'
  checksum      = '522fd94156bf006e1d6dfbd996e150521cafea62ed8109ee01e7f681d71dcdfd'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.2.1000.0x64.msi'
  checksum64    = '4f5c2ba21693077c6cfde3864c04dc328e8394dbdbbf9e7d21385c2c2b90e0e0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
