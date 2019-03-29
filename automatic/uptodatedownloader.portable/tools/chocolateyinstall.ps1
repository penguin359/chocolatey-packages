$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\uptodatedl.exe"

  url           = 'https://www.wintools.info/Download/uptodatedl.exe'
  checksum      = '9C838222EDDE713ACDAE9A912D63C238AC3CAD90904BD5F41E01B08FEF637743'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
$targetPath = Join-Path $toolsDir "uptodatedl.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath