$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\FFmpeg_Batch_2.3.6_Portable_x86.zip"
  file64      = "$toolsDir\FFmpeg_Batch_2.3.6_Portable_x64.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare '64') { $arch = '_x64' } else { $arch = '' }

$shortcutFilePath = Join-Path $programs 'FFmpeg Batch Portable.lnk'
$targetPath = Join-Path $toolsDir "FFmpeg_Batch_2.3.6_Portable${arch}.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
