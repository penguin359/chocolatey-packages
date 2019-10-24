$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
  checksum       = '9159e9583e44e1172fd578a59f43db33867210b33ebc22b1a4d4de0e412079c7'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
  checksum64     = '762c4ad1a0523a2e693625df7781505735b721c470da972d8913f17e8120f45f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Ocenaudio.lnk"
$targetPath = Join-Path $toolsDir "ocenaudio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
