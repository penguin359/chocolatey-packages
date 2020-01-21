$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath	= "$toolsDir\unetbootin.exe"
  
  url           = 'https://github.com/unetbootin/unetbootin/releases/download/677/unetbootin-windows-677.exe'
  checksum      = '7821b86a10b955561f101088b88b51cf0e63721e5e61d3504fb41445e09a1a86'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
$targetPath = Join-Path $toolsDir "unetbootin.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
