$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\KeeperSetup32.exe"
  file64        = "$toolsDir\KeeperSetup64.exe"

  url           = 'https://keepersecurity.com/desktop_electron/Win32/KeeperSetup32.zip'
  checksum      = '4a6d875ead31610a3873b4d60abc6fb8f04be9de4f32467c938485e118a72b01'
  checksumType  = 'sha256'

  url64         = 'https://keepersecurity.com/desktop_electron/Win64/KeeperSetup64.zip'
  checksum64    = 'c71e0f08a336eed5205c97ae9e7569d89fd4e62a80438b3d938d171665b5e203'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
