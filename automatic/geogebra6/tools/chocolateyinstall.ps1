$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\GeoGebraGraphing-Windows-Installer-6-0-535-0.exe"
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GeoGebra Graphing Calculator.lnk"
$targetPath = Join-Path $toolsDir "GeoGebraGraphing-Windows-Installer-6-0-535-0.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath