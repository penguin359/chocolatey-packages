$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url            = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin32.exe'
  checksum       = 'f9c2712ca197ec6b91887f4b60db7fcbb3a05826875c0fabd427bdbfe34b1f41'
  checksumType   = 'sha256'

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = 'c24909d7e514ad5bd2ae03c94b1384630f78fbc0c838d848cc524cb5401ac730'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
