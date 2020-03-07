$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\uptodatedl.exe"

  url           = 'https://www.wintools.info/Download/uptodatedl.exe'
  checksum      = 'C427BA00F4C6263B2FAAE2A15252161736145333950472DAC185AA15C479EE1F'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
$targetPath = Join-Path $toolsDir "uptodatedl.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
