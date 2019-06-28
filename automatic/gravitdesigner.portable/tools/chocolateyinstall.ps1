$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  fileFullPath  = "$toolsDir\GravitDesigner.exe"

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesigner.exe'
  checksum      = 'eed5e198f17952a9f747909791168f2f74aacf5270be7b87189a309f564aedf8'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Gravit Designer.lnk"
$targetPath = Join-Path $toolsDir "GravitDesigner.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath