$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  file         =  'toff.exe'

  url           = 'https://dennisbabkin.com/php/downloads/TOff.zip'
  checksum      = '75bb3e195597c66de2424f1b13ab6298e16902907e6309f2f5b922165801bb1d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "TOff.lnk"
$targetPath = Join-Path $toolsDir "toff.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
