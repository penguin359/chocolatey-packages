$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-win32-x86_64.zip'
  checksum      = '736ff2a3a5253a6cd8fb44d268b1b05b0641183f10d6e5e67eb25c01bf404d0f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Eclipse IDE for Java Developers.lnk"
$targetPath = Join-Path $toolsDir "eclipse\eclipse.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
