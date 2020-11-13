$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath	= "$toolsDir\unetbootin.exe"
  
  url           = 'https://github.com/unetbootin/unetbootin/releases/download/700/unetbootin-windows-700.exe'
  checksum      = '65ba5ff090be1cc96dec40509c9002582f4663634cb63b311941321907701483'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
$targetPath = Join-Path $toolsDir "unetbootin.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
