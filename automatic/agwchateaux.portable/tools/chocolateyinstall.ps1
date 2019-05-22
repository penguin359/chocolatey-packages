$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Chateaux"

  url           = 'http://f1agw.free.fr/AGW_Chateaux/AGW_Chateaux_178_SI.zip'
  checksum      = '044a822842e4cb8da2984e35b2991afc65dc70d05908bc5a4d4caa7e5978cb2c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AGW Châteaux.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Chateaux" "AGW_Chateaux.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
