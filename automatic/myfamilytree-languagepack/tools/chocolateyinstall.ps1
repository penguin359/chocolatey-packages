$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.1000.0.msi'
  checksum      = 'f1849ad04d6b2aff40fee2afec4ba71fb572150dee6d0deda79d353aeb30c9c8'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.3.1000.0x64.msi'
  checksum64    = 'cef8923f2acd737683c4ee7909bdb77aa1516d9e1286ecfeec361cc368303239'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
