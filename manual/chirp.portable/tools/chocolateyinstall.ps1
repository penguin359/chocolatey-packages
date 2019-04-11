$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  file         =  'chirpw.exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/LATEST/chirp-daily-20190411-win32.zip'
  checksum      = '689be237ca7cd42776e580dff1f07d6719177b89014e744c9eb3dbcbcad93af7'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "CHIRP.lnk"
$targetPath = Join-Path $toolsDir "chirpw.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
