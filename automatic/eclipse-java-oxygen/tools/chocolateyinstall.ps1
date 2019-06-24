$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  

  url           = 'https://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/2019-06/R/eclipse-java-2019-06-R-win32-x86_64.zip'
  checksum      = '36650e72f7f9a6d45f4c49f33c5f43ec9d985c79131ef123240f0422e2de6d18'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Eclipse IDE for Java Developers.lnk"
$targetPath = Join-Path $toolsDir "eclipse\eclipse.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath