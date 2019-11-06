$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file64      = "$toolsDir\Rack-1.1.6-win.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
