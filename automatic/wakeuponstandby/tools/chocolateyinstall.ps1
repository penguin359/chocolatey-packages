$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  file         =  'wosb.exe'

  url           = 'https://dennisbabkin.com/php/downloads/WakeupOnStandBy.zip'
  checksum      = '58189BBB715303A5C8038924C50641BA14E4C964AB1847F04ADB163FA0DEDF81'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "WakeupOnStandBy.lnk"
$targetPath = Join-Path $toolsDir "wosb.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath