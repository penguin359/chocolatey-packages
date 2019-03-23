$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installFile = Join-Path $toolsDir "$($packageName).exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath	= "$toolsDir\unetbootin.exe"
  
  url           = 'https://github.com/unetbootin/unetbootin/releases/download/661/unetbootin-windows-661.exe'
  checksum      = 'E2614493C4E5CA6BE32A72DCAE1FDCD155D11EBB49B3F37E9D4C7DB6DD71EC22'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs

#Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
$targetPath = Join-Path $toolsDir "unetbootin.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
