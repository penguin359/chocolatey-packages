$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = "$env:ChocolateyPackageName"
  file        = "$toolsDir\laragon-full.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components="'
}

Install-ChocolateyInstallPackage @packageArgs
