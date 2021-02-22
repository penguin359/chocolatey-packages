$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.1000.0.msi'
  checksum      = 'cb3c36168b5422673a939a0d6de9beb5fa7024976cc7f50fe67e0a35bbd6a75b'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.9.1000.0x64.msi'
  checksum64    = '49bddc093391e7fbbffb100b71c5951b4d97cd501fd32297430eb8713395abfe'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
