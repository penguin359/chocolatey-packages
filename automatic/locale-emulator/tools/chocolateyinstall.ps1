$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file          = "$toolsDir\LEInstaller.exe"

  url           = 'https://github.com/xupefei/Locale-Emulator/releases/download/v2.4.0.0/Locale.Emulator.2.4.0.0.zip'
  checksum      = '94FC8351CF99941D1D8739E384753D8A085A075DDA4A86BC6049EE7EC4F49720'
  checksumType  = 'sha256'   
}

Install-ChocolateyZipPackage @packageArgs

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
$targetPath = Join-Path $toolsDir "LEGUI.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning 'Launch LEGUI or "Locale Emulator GUI" from start menu to access settings.'