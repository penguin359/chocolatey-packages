$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\TCP_IP_Manager_v4.1.1.29_x86_Setup.exe"
  file64      = "$toolsDir\TCP_IP_Manager_v4.1.1.29_x64_Setup.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs