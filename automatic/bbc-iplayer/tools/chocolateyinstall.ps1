$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://live-downloads-app-bucket-staticassetsbucket-ydn3z4ggyaof.s3.amazonaws.com/releases/win32-x64/BBCiPlayerDownloadsSetup-2.9.0.exe'
  checksum      = '841700C4B340A72025F94EFA43165B9A2C7CD5D300C05F156CE498A0A769083E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\bbciplayerdownloads-2.9.0-full.nupkg" 
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BBCiPlayerDownloads.lnk"
$targetPath = Join-Path $toolsDir "lib\net45\BBCiPlayerDownloads.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath