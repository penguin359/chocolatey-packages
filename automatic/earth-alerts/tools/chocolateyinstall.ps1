$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://earthalerts.manyjourneys.com/files/Setup_EarthAlerts.zip'
  checksum      = 'fe92e52593128b2ec48d750aa1a03b0a08d669920a57b8c303a624442b0af01b'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  fileType      = 'MSI'
  file          = "$toolsDir\EarthAlerts.msi"

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}
Install-ChocolateyInstallPackage @packageArgs
