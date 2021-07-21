$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.1000.0.msi'
  checksum      = '09a6df3b8fa30904172a69d68c808ea94f6745752788767e730c1c1084bc4499'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack11.0.1000.0x64.msi'
  checksum64    = '4f2e9a25d09e1fdb3fe8c7cff1217ca21e37bd03ad502b9b419074ac8ff281e1'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
