$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://www.z-download.de/down/zcron.zip'

  checksum      = '0CBD0F6D0F6348EC775B38F7B496E9468438F6C649E074ADC892F43ACB1A0F5C'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'

  file          = "$toolsDir\zcron.exe"
  softwareName  = 'Z-Cron'
  
  silentArgs	= '/Silent /Languageid 1033'
}

Install-ChocolateyInstallPackage @packageArgs

# Close z-cron due to the automatic startup after installation
Get-Process 'z-cron' | Stop-Process
