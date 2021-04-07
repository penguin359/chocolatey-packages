$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url            = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin32.exe'
  checksum       = 'e67f0297b0346abd9383d6f87e6353a3103ab9ad3230c7716171a83743d214a6'
  checksumType   = 'sha256'

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = 'b0408e231b5baab9c04fce7d06877adee172969980e77f6c23027cb7fa59f2e1'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
