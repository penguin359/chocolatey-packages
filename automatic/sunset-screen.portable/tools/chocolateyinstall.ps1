$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filefullpath = "$toolsDir\SunsetScreen.exe"

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
  checksum     = '68cdb6523e68dd092b4424b31dceec6e6facc22d87b59fd0d6f675e79944e617'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SunsetScreen.lnk"
$targetPath = Join-Path $toolsDir "SunsetScreen.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
