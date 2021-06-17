$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.0000.0.msi'
  checksum      = '25b885d2d3692a4890fbb58f3987e58cbcd49f72a55e05285cd5151c83644615'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.0000.0x64.msi'
  checksum64    = '3a13f57cb9ee782ac7a4629403824944e4cf15b516b555f3ee62e3cb02296c58'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
