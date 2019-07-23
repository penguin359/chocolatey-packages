$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\rtmpdump-2.4-2015-12-15.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "TITLE.lnk"
$targetPath = Join-Path $toolsDir "FILE"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
# Remove start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "TITLE.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }