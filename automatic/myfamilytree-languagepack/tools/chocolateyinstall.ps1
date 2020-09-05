$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.4.1000.0.msi'
  checksum      = '9cb1d068804b80fe22e29dc16a9aff8036283b00a140023bbc64957c2b4cc8b2'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.4.1000.0x64.msi'
  checksum64    = '88045762b9ea5df632751d748435fb37274c1ec5eaa60ba0c3a6c50811b4b345'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
