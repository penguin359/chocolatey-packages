$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Chateaux"

  url           = 'http://f1agw.free.fr/AGW_Chateaux/AGW_Chateaux_177_SI.zip'
  checksum      = '781452A44C60C4F34FF322D6EFBE5F8476F662F75032BB8475395BECBDD900A0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "AGW Châteaux.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Chateaux" "AGW_Chateaux.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath