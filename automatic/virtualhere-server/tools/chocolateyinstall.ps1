$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url            = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin32.exe'
  checksum       = '86223c7791b5639c5e6683bc3ec1d27d83c8120b469c0ebcfed89521d28efd00'
  checksumType   = 'sha256'

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = '428beef9a624797cffa16e4cd39f843e40f9e7d86050fa299734953686d61924'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
