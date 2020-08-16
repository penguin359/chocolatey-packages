$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.2000.0.msi'
  checksum      = '206d9e1cf1c3241f9b450a7d366452ff97a57656fde14354a52f8f832d1a9485'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.2000.0x64.msi'
  checksum64    = '9b7d002efec9b578b4c18a27559ea73582a3988225569b51460803931fc7dcb5'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
