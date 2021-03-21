$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\SessionManagerPluginSetup.exe"
  silentArgs  = '/quiet'
}

Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPath -PathToInstall "${env:PROGRAMFILES}\Amazon\SessionManagerPlugin\bin"

Write-Warning "${env:PROGRAMFILES}\Amazon\SessionManagerPlugin\bin as been added to the PATH environment variable to launch directly the session-manager-plugin.exe command."
