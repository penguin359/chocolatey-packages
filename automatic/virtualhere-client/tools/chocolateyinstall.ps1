$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhui$(Get-OSArchitectureWidth).exe"

  url            = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui32.exe'
  checksum       = 'b570f3ebb0009521d6a9ce3fb20490ba0f462732113ceb977e0332248078450e'
  checksumType   = 'sha256'

  url64          = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
  checksum64     = '15a375f77ab5168ae3080819c818e62806deda834c4ccc3342d5be7f106a9ffd'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Client.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
