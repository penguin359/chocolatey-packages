$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\die_win32_portable_2.05.zip"
  file64        = "$toolsDir\die_win64_portable_2.05.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Detect It Easy.lnk"
$targetPath = Join-Path $toolsDir "die_win32_portable\die.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs "Detect It Easy Lite.lnk"
$targetPath = Join-Path $toolsDir "die_win32_portable\diel.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
