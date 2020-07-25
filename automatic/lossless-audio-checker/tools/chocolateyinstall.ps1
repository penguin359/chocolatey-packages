$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'http://losslessaudiochecker.com/dl/Lossless-Audio-Checker-Windows-32bit.zip'
  checksum       = '8105B6A865C38CC09F24C9852DBC19357893E3E099E86B2E2E2C9D2F3855B32A'
  checksumType   = 'sha256'

  url64          = 'http://losslessaudiochecker.com/dl/Lossless-Audio-Checker-Windows-64bit.zip'
  checksum64     = 'A5370AA6D42086666081FC0626B5C7877EC8FB0BAB21017BF36F6FF1E94B63F7'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Lossless Audio Checker.lnk"
$targetPath = Join-Path $toolsDir "Lossless Audio Checker.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath