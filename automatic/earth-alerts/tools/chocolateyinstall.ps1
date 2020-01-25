$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://earthalerts.manyjourneys.com/files/Setup_EarthAlerts.zip'
  checksum      = '81E942A99336AD18DCF31B985B0D89947754FFD2B62EE3503A1A48C41BF884E3'
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
