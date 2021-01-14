$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url            = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin32.exe'
  checksum       = 'dd1d04a0c5b41ed460e39a3b8620a02fb4d48d9d27971ba04caa8b3368ed9475'
  checksumType   = 'sha256'

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = '9118f8c67bc80656c92a62b70154c0018ac260c2ad74ecd286c685640fc86a8c'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
