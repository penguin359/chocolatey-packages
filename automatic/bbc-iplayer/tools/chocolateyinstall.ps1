$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://static.files.bbci.co.uk/iplayer-pc-download-app/releases/win32-x64/BBCiPlayerDownloadsSetup-2.13.1.exe'
  checksum      = '88cf1d347a30eddaff511b8e208e9f56be4a64632d1ee858858bb811a866d8b5'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\bbciplayerdownloads-2.13.1-full.nupkg" 
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BBCiPlayerDownloads.lnk"
$targetPath = Join-Path $toolsDir "lib\net45\BBCiPlayerDownloads.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
