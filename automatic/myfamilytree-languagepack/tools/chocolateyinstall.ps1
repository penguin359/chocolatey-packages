$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.1000.0.msi'
  checksum      = 'ba4e1b6640d54d825ca89a4d514e648e40d0c6ab505aee963f3f49a1db973391'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack8.7.1000.0x64.msi'
  checksum64    = 'c5ecef6d8cf41ba9046b8dfa31025d45d3e4727af52f3ba2180a0e4d65664c2b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
