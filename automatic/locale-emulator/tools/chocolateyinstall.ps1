$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  file          = "$toolsDir\Locale.Emulator.2.4.1.0\LEInstaller.exe"

  url           = 'https://github.com/xupefei/Locale-Emulator/releases/download/v2.4.1.0/Locale.Emulator.2.4.1.0.zip'
  checksum      = '6c9251cd1b788c1c46be5541fa1895ad88a37a886785038c4188cac80aceaae4'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
$targetPath = Join-Path $toolsDir "Locale.Emulator.2.4.1.0\LEGUI.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning 'Launch LEGUI or "Locale Emulator GUI" from start menu to access settings.'