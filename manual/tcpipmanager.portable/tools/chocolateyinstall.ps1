$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"
  file         = "$toolsDir\TCP_IP_Manager_v4.1.1.29_x86.7z"
  file64       = "$toolsDir\TCP_IP_Manager_v4.1.1.29_x64.7z"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "TCP-IP Manager.lnk"
$targetPath = Join-Path $toolsDir "TCP IP Manager\TCP_IP_Manager.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath