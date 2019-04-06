$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  file         =  'toff.exe'

  url           = 'https://dennisbabkin.com/php/downloads/TOff.zip'
  checksum      = 'A88467141BCFFB6F1A755BC3AEE557639AFC20ABADE115CAA152210AE7CAD7FC'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "TOff.lnk"
$targetPath = Join-Path $toolsDir "toff.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath