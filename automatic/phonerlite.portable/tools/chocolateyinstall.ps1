$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  
  url           = 'https://www.phoner.de/PhonerLite.zip'
  checksum      = '18189C34F8EF4BCADB94A96AAE8E6E5DA97ADE060D43F9D0EED78DE316CD9001'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PhonerLite.lnk"
$targetPath = Join-Path $toolsDir "PhonerLite.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath