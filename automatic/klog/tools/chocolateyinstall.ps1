$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'KLog'
  fileType      = 'exe'
  file          = "$ToolsDir\KLog-1.4-windows-installer.exe"
  silentArgs    = "--mode unattended"
}

Install-ChocolateyPackage @packageArgs
