$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.5000.0.msi'
  checksum      = '9976e794b6fffdef49f6ff197d9b7ab2c3ad0457dffacc6e05165a826fc3724b'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.9.5000.0x64.msi'
  checksum64    = 'eb5f57d91c1a138227d13549d511511b15bcacd10a37162ee024128f938f46a9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
