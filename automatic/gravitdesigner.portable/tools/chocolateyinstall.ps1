$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  fileFullPath  = "$toolsDir\GravitDesigner.exe"

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesigner.exe'
  checksum      = '9b48c0cd01071a297d06af4c65313a9c57540a187be3b28f12c423503e83493c'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Gravit Designer.lnk'
$targetPath = Join-Path $toolsDir 'GravitDesigner.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
