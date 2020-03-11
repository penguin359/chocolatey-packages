$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://earthalerts.manyjourneys.com/files/Setup_EarthAlerts.zip'
  checksum      = '13fa1a19d3bb553b63fbae1bbd6265ed25d97b3a4b9a3ffd3632c11998cc459f'
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
