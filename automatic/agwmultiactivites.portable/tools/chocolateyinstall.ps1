$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:ProgramFiles\AGW_Multi_Activites"

  url           = 'http://f1agw.free.fr/AGW_Multi_Activites/AGW_Multi_Activites_125_SI.zip'
  checksum      = '358C0971CFA47E98E847532B39024E7FC3F52B4627BE34EE01EFCA341F55FA86'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "AGW Multi Activités.lnk"
$targetPath = Join-Path "$env:ProgramFiles\AGW_Multi_Activites" "AGW_Multi_Activites.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath