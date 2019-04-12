$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  
  url           = 'https://www.phoner.de/PhonerLite.zip'
  checksum      = '2E58A59EDF817B3F54D0444B649ADE866ABB51DBA9AD1B13A1F143A8CB37CBB1'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PhonerLite.lnk"
$targetPath = Join-Path $toolsDir "PhonerLite\PhonerLite.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath