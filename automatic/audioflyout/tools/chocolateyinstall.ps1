$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\AudioFlyout.zip"
}

if ([System.Environment]::OSVersion.Version.Build -lt 17763) {
  Write-Warning "Skipping installation because AudioFlyout supports only Windows 10 Build 17763 and later."
  return
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AudioFlyout.lnk"
$targetPath = Join-Path $toolsDir "ADeltaX\AudioFlyout\AudioFlyout.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
