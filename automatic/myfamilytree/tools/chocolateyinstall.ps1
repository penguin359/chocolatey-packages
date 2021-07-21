$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.0.1.0.msi'
  checksum      = 'e98ace020a1a6d85478723448cef8acfc99b3ad41dc4ae2b2f14f9bd0afe4cad'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree11.0.1.0x64.msi'
  checksum64    = '849da5bb024eb548edc179d484dbc078332229f24eda2282fcdc38dc52f9f505'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
