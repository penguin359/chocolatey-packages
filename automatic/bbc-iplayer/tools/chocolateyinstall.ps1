$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://live-downloads-app-bucket-staticassetsbucket-ydn3z4ggyaof.s3.amazonaws.com/releases/win32-x64/BBCiPlayerDownloadsSetup-2.12.4.exe'
  checksum      = '737eeffbf668d21af2ad782e2610d004597b9ce32588b13d79a349d0040e6f6c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\bbciplayerdownloads-2.12.4-full.nupkg" 
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BBCiPlayerDownloads.lnk"
$targetPath = Join-Path $toolsDir "lib\net45\BBCiPlayerDownloads.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
