$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = "$14.11.1.10027-2017.vsix"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  vsixUrl     = 'file://' + $file.Replace('\', '/')
}

Install-VisualStudioVsixExtension @packageArgs
