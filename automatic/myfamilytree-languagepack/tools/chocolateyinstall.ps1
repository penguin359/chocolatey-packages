$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.1000.0.msi'
  checksum      = '77ff3d5a3d9012b16263fff2f7dd223ae1a9528b93f0369e75231f874570723c'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack10.1.1000.0x64.msi'
  checksum64    = '0647d4b696fc9f459c4baf1bdb4321d101712c7579b6b5ebbd7d09bf8b74848f'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
