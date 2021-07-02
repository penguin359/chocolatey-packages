$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '0c66a16eb4b28af7e7886ecdda7941898c269d5c745412fa34e57dbc2665177c'
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

Write-Warning "The installation takes several dozens of minutes while MTL libraries are downloaded."

Install-ChocolateyInstallPackage @packageArgs
