$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\KeeperSetup32.exe"
  file64        = "$toolsDir\KeeperSetup64.exe"

  url           = 'https://keepersecurity.com/desktop_electron/Win32/KeeperSetup32.zip'
  checksum      = '78b0415916dba442c40a8da96ea58c92690d0ed172592a4545b3df9c8ba58bdc'
  checksumType  = 'sha256'

  url64         = 'https://keepersecurity.com/desktop_electron/Win64/KeeperSetup64.zip'
  checksum64    = '71b7e4dba01d5760675685090c5dafe9bba101490d373fa89a0125599b000033'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
