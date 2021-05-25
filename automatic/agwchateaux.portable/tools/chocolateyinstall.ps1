$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Chateaux"

  url           = 'http://f1agw.free.fr/AGW_Chateaux/AGW_Chateaux_179_SI.zip'
  checksum      = '8f27661c1fafe55c72d5feb2c1f2516dc56acd1812875bf445d6584344842849'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AGW Châteaux.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Chateaux" "AGW_Chateaux.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
