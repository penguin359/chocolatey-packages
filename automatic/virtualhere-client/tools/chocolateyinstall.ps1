$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhui$(Get-OSArchitectureWidth).exe"

  url            = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui32.exe'
  checksum       = '4079CAED7C1E511CC6CA8680DCF9CB89D0FC31AD08BAE76AA67F0A9F283646E3'
  checksumType   = 'sha256'

  url64bit       = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
  checksum64     = '2ED04157F0CA1D392A1234436C6674AAB1DBB40CA3C7A10422C41FB815DCC7E6'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Client.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath