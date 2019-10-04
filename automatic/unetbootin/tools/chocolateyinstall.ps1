$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath	= "$toolsDir\unetbootin.exe"
  
  url           = 'https://github.com/unetbootin/unetbootin/releases/download/675/unetbootin-windows-675.exe'
  checksum      = '7f91fabb2bde521355342b6c9f3408203a9e1dfe9494cededdac9135a7bdb7c4'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
$targetPath = Join-Path $toolsDir "unetbootin.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
