$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'mailslurper-1.14.1-windows.zip'