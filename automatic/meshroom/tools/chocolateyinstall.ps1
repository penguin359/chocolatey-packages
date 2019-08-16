$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://github.com/alicevision/meshroom/releases/download/v2019.2.0/Meshroom-2019.2.0-win64.zip'
  checksum64     = '9d965e16b49dc9c0d44a6544ed0aba0a9c44c321d4663856b126c1d5eeca1188'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Meshroom.lnk"
$targetPath = Join-Path $toolsDir "Meshroom-2019.2.0\Meshroom.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath