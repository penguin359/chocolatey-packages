$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://earthalerts.manyjourneys.com/files/Setup_EarthAlerts.zip'
  checksum      = '0e7eb135519c5df23327f29ea335db3c76d0421d464ef619e9d94e8c58a5af53'
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
