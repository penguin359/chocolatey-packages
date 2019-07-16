$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  fileFullPath  = "$toolsDir\GravitDesigner.exe"

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesigner.exe'
  checksum      = '941133b4368a1e578954778762f00c9e501ea1dca8043322ca16e1c7ab86c8c0'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Gravit Designer.lnk"
$targetPath = Join-Path $toolsDir "GravitDesigner.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
