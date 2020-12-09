$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '7823a444f5539dd71df9f0adc84c58d60062a5c6d462bb32dca95254c3a206f5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyZipPackage @packageArgs

$exe_file = (Get-ChildItem -Recurse $toolsDir\IVAO_Pilot_MSFS2020_*.exe).fullname | Select -First 1

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$exe_file"
  silentArgs    = '/S'
}

Write-Warning "The installation takes several dozens of minutes as MTL libraries are downloaded."

Install-ChocolateyInstallPackage @packageArgs