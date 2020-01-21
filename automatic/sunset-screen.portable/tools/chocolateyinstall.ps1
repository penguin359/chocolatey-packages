$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filefullpath = "$toolsDir\SunsetScreen.exe"

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
  checksum     = '06a980a82bf50c3920f8963f85fcbcafb79893e7e8e2c633f20e514d0982ab17'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SunsetScreen.lnk"
$targetPath = Join-Path $toolsDir "SunsetScreen.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
