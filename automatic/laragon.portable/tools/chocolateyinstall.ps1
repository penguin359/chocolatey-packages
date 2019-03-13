$ErrorActionPreference = 'Stop';
$packageName= 'laragon.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://github.com/leokhoa/laragon/releases/download/4.0.12/laragon.7z'
  file         =  'laragon.exe'  

  checksum      = '221FD74474310C1E4756CD6758EB68361635CFB8DB3692173106EA54BF0B0DFC'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Laragon.lnk"
$targetPath = Join-Path $toolsDir "laragon.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath