$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Moneydance_windows_amd64.exe"  
  silentArgs	= "-q"
}

Install-ChocolateyInstallPackage @packageArgs