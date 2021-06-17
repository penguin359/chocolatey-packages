$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  fileFullPath  = "$toolsDir\GravitDesigner.exe"

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesigner.exe'
  checksum      = '76b430a362ca438a07badaf1624636ed05386d2a8b43311da068ef1adadb7c33'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Gravit Designer.lnk'
$targetPath = Join-Path $toolsDir 'GravitDesigner.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
