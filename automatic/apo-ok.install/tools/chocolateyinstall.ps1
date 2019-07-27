$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\AutoPowerOptionsOK.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "APO-OK.lnk"
$targetPath = Join-Path $toolsDir "APO-OK.exe"
Install-ChocolateyShortcut "$toolsDir" -shortcutFilePath $shortcutFilePath -targetPath $targetPath