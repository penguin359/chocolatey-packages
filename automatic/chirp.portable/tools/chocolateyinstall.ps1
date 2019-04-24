$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file         =  'chirpw.exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190424/chirp-daily-20190424-win32.zip'
  checksum      = '8c002bf12231ec89aa285776d6e012b5f8216b991e70a450a1e74f60fa2cb114'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "CHIRP.lnk"
$targetPath = Join-Path $toolsDir "chirpw.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
