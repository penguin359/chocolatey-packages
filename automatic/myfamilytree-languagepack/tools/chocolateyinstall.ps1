$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.2000.0.msi'
  checksum      = '86f8eed0cfbf4d39dbb6775fc1c180a2240917f68517e2f93e29e0baf0dea60b'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.8.2000.0x64.msi'
  checksum64    = '230eacd4b66928a610ff98e7bfa78904c7ea616c28bb0dbd0e5a6530ce2be24f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
