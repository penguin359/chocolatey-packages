$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.2000.0.msi'
  checksum      = '592cc86516fd243e97ce68880b2d95b8779bb8cca5366494cf82531ab0d03f0f'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.1.2000.0x64.msi'
  checksum64    = 'd20caa502ed9b55cb20b912bba9dc188c3998fd16b48a3b72415ce38e26e7ba4'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
