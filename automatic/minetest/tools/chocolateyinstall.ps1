$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsLocation"
  file          = "$toolsDir\minetest-5.4.0-win64.zip"
  file64        = "$toolsDir\minetest-5.4.0-win32.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Minetest.lnk"
$targetPath = Join-Path $toolsDir "minetest-5.4.0-win$(Get-OSArchitectureWidth)\bin\minetest.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath
