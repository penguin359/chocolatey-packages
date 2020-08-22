$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.4000.0.msi'
  checksum      = '39fef1cb27f29a059f3bfebc854651b1f43a66798327ab640b8ef0f019bbf55b'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.4000.0x64.msi'
  checksum64    = 'b23319abcd231d2df8e741218fa5f783f17e3661b54bb5556322ae416055240a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
