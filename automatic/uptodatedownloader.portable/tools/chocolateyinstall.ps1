$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\uptodatedl.exe"

  url           = 'https://www.wintools.info/Download/uptodatedl.exe'
  checksum      = 'c427ba00f4c6263b2faae2a15252161736145333950472dac185aa15c479ee1f'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
$targetPath = Join-Path $toolsDir "uptodatedl.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
