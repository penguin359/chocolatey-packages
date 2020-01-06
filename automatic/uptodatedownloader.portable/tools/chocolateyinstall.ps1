$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\uptodatedl.exe"

  url           = 'https://www.wintools.info/Download/uptodatedl.exe'
  checksum      = 'c6b270c66273987a2c712a6d57756eaffd14ba887289077e573ca0add66e6e25'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
$targetPath = Join-Path $toolsDir "uptodatedl.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
