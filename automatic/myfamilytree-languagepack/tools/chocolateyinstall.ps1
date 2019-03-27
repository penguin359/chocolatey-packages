$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.2000.0.msi'
  checksum      = '38AF5A24004729D325A2CFC2D5947C8AAE722537CA003623717EDB6B9B12C0AD'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.6.2000.0x64.msi'
  checksum64    = '124F1D465D45CC32CE00CCBC603CB1D4BC0AB356144F5D3215DF5A2036ED33EF'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs