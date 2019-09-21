$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'MSI'
  file64      = "$toolsDir\PhotoFlare_CE_1.5.9_amd64.msi"
  silentArgs  = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs