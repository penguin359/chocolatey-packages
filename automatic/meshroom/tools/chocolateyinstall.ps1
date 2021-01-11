$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://www.fosshub.com/Meshroom.html?dwl=Meshroom-2020.1.1-win64.zip'
  checksum64     = 'db98d7ca485feb3c3304bb3eb5d1bff768c974c63094827122bc98f7a3b220cf'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Meshroom.lnk"
$targetPath = Join-Path $toolsDir "Meshroom-2020.1.1\Meshroom.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
