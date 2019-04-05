$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.6.4.0.msi'
  checksum      = '5c55024932e50b61f0480450ae1aa97dfb38e2706f53e0bfdc878028cd4b593b'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree8.6.4.0x64.msi'
  checksum64    = '5ed294a9716fa25f7a75dc95e28ee801cd0c1d42fe3b7b02c0c054b36b1ecd3b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
