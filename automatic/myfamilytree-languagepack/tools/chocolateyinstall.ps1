$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.0000.0.msi'
  checksum      = '3dbaf403bb893988950dfe507bb64736fe16ce99d1b6f3c9217e7931ffa02a71'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.0000.0x64.msi'
  checksum64    = '4c6d169a4b521689f15ee926096b797e1c8ba3099fac6914bd59dd649435d655'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
