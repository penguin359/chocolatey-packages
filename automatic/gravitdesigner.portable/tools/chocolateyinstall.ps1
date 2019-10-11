$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  fileFullPath  = "$toolsDir\GravitDesigner.exe"

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesigner.exe'
  checksum      = '4f1a210bc69d520818d14c2399ffc5b4bcfe8247d251d20b8eb2c31a47584319'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Gravit Designer.lnk"
$targetPath = Join-Path $toolsDir "GravitDesigner.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
