$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.0000.0.msi'
  checksum      = '1be60c8cefe7150d4962a7cb7c914d1d46e90e62e11640f7d8537f0aeb766099'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.0000.0x64.msi'
  checksum64    = '4f6fce8ae16ceafc06c9bf088a7bd1c368365e5e9c7a4fcf30452b0ab128ac4a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
