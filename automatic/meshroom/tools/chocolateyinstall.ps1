$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://github.com/alicevision/meshroom/releases/download/v2021.1.0/Meshroom-2021.1.0-win64.zip'
  checksum64     = ''
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Meshroom.lnk"
$targetPath = Join-Path $toolsDir "Meshroom-2021.1.0\Meshroom.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
