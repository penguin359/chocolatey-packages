$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = "$toolsDir\SonarLint.VSIX-4.35.0.32570-2017.vsix"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  vsixUrl     = 'file://' + $file.Replace('\', '/')
}

Install-VisualStudioVsixExtension @packageArgs
