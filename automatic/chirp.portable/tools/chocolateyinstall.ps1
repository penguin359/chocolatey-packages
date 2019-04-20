$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file         =  'chirpw.exe'
  
  url           = 'https://trac.chirp.danplanet.com/chirp_daily/daily-20190412/chirp-daily-20190412-win32.zip'
  checksum      = '952130542668d9dc235ec076239424695b30d799a0fb07af51761e3554a18276'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "CHIRP.lnk"
$targetPath = Join-Path $toolsDir "chirpw.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath