$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  file         =  'laragon.exe'

  url           = 'https://github.com/leokhoa/laragon/releases/download/4.0.14/laragon.7z'
  checksum      = '65837d2c9daf0994345746a7b405a2a728cc422f15cb8f858f919e68d1f82c02'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Laragon.lnk"
$targetPath = Join-Path $toolsDir "laragon.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
