$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  filetype    = "MSI"
  file        = "$toolsDir\wireguard-x86-0.3.2.msi"
  file64      = "$toolsDir\wireguard-amd64-0.3.2.msi"

  silentArgs  = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""  
}

Install-ChocolateyInstallPackage @packageArgs
