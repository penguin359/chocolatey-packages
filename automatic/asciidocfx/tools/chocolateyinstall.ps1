$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\AsciidocFX_Windows.exe"
  silentArgs  = '-q'
}

Install-ChocolateyInstallPackage @packageArgs
