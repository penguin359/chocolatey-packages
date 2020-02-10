$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.5.0.msi'
  checksum      = '94a5bb47a6e5279b7d12fb8a9eaa5808d4c4e8b58babcbf9c9f857f747ddb471'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree9.2.5.0x64.msi'
  checksum64    = 'f877664cea590ac076ec252054caab15f70381eab3066d6728e1fa01aca0e17a'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
