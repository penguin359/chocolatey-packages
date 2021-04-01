$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file64      = "$toolsDir\labplot-2.8.2-64bit-setup.exe"
  #silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' No longer used since version 2.8.1
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
