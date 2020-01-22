$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\uptodatedl.exe"

  url           = 'https://www.wintools.info/Download/uptodatedl.exe'
  checksum      = 'C6B270C66273987A2C712A6D57756EAFFD14BA887289077E573CA0ADD66E6E25'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
$targetPath = Join-Path $toolsDir "uptodatedl.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
