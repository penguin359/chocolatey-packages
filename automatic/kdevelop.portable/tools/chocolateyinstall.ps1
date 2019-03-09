$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = "kdevelop.portable"
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://kfunk.blaucloud.de/index.php/s/wr2CsjmGyqkgyNF/download?path=%2F&files=kdevelop-5.1.2-x86-portable.7z'
  url64bit      = 'https://kfunk.blaucloud.de/index.php/s/wr2CsjmGyqkgyNF/download?path=%2F&files=kdevelop-5.1.2-x64-portable.7z'
  
  checksum      = '570568AD29F6AFD8E4B062958B5E8AAFE09FA807C4AECE41CFE7238EDD6A9899'
  checksumType  = 'sha256'
  checksum64    = '35B0A432ABE2320041E4887DE8485B7E79886AA980589E00F9448033251B783B'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
    
#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

