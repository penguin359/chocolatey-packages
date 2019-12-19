$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.1000.0.msi'
  checksum      = '913a3f5cb0dc593397723e96327ed1ee6e6148739d268313da562a9ddaa640b0'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.1000.0x64.msi'
  checksum64    = 'b7271fcdaafcd623ad85ee6e2e82b141273aac43bd4b51a4a456af6cb5c0bf47'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
