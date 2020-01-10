$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\cutecw-1.0.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Cute CW.lnk"
$targetPath = Join-Path $toolsDir "cutecw-1.0\cutecw.exe"
Install-ChocolateyShortcut -iconLocation "$toolsDir\cute-cw.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath