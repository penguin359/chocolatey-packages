$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath	= "$toolsDir\unetbootin.exe"
  
  url           = 'https://github.com/unetbootin/unetbootin/releases/download/681/unetbootin-windows-681.exe'
  checksum      = 'c7df6cbd8bdc651955c761b0a5ab2d9dae10b96dfa5c6aceda4adc64c030c607'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
$targetPath = Join-Path $toolsDir "unetbootin.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
