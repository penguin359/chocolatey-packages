$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\DjVuLibre-3.5.28_DjView-4.12_Setup.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs

$path = Get-AppInstallLocation DjVuLibre
if ($path) {
  Install-ChocolateyPath -PathToInstall "$path"
}
