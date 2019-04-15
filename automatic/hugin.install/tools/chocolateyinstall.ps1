$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'msi'
    
  url           = 'https://freefr.dl.sourceforge.net/project/hugin/hugin/hugin-2019.0/Hugin-2019.0.0-win64.msi'
  checksum      = 'D9692E6A87AF591A15B04EDE07B1A75263AA6B57543F01E3E6ADA15B25F61A35'
  checksumType  = 'sha256'

  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
