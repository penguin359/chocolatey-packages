$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'msi'

  url           = 'https://voipcallrecording.com/MP3SkypeRecorderSetup.msi?version=4.51'
  checksum      = '00EA323F4545E82EBBAD38F57249F5F68ECC208183422114FA035CDB52DB45EF'
  checksumType  = 'sha256'
  
  silentArgs	= "/qn /norestart /l*v $env:Temp\$env:ChocolateyPackageName.MsiInstall.log"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs