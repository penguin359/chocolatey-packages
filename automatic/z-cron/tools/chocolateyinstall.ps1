$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://www.z-download.de/down/zcron.zip'

  checksum      = 'D974AF336093F2B365ED3A924445EAF42EBEBC324290A29B48DF1CAD27A3A703'
  checksumType  = 'sha256'
  
  file          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\zcron.exe"
  softwareName  = 'Z-Cron'
  
  silentArgs	= '/Silent /Languageid 1033'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs

# Close z-cron due to the automatic startup after installation
Get-Process "z-cron" | Stop-Process