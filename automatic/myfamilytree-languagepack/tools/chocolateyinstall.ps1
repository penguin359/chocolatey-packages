$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.0.4000.0.msi'
  checksum      = '78cbac40ae744d238063812e0f70b2940bcfc2832055d539897d353982f4feb6'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.0.4000.0x64.msi'
  checksum64    = '2868e2c4698a8f16958eb792768e82323b78ac28847c64b996152c301a168e6f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
