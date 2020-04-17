$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.0.0000.0.msi'
  checksum      = '956dfab07cf36d5f673cdf7628a59fce4d29cf06e83fa813bb788ee57f34b594'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.0.0000.0x64.msi'
  checksum64    = 'b9bd3d2933664fc7c991d93e88cc1a3583985edaea468de45fc1e9632bb1680c'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
