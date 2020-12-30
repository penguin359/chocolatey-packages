$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filefullpath = "$toolsDir\SunsetScreen.exe"

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
  checksum     = '7a0f2d951fcb07bb79a60709c74229b41ec7b0b4d177a612e31a71aa64631c59'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SunsetScreen.lnk"
$targetPath = Join-Path $toolsDir "SunsetScreen.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
