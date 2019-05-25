$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "$toolsDir\AutoClicker.exe"

  url          = 'https://freefr.dl.sourceforge.net/project/orphamielautoclicker/AutoClicker.exe'
  checksum     = '2E67D5E7D96AEC62A9DDA4C0259167A44908AF863C2B3AF2A019723205ABBA9E'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Auto Clicker.lnk"
$targetPath = Join-Path $toolsDir "AutoClicker.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath