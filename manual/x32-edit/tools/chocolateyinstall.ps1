$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://mediadl.musictribe.com/download/software/behringer/X32/X32-Edit_PC_4.2.zip'
  checksum      = 'a5971f783a5454f4ef66528d1e0d26510e984e07f524f3b179193f8e4e057192'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'X32 Edit.lnk'
$targetPath = Join-Path $toolsDir 'X32-Edit.exe'
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"