$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file    = "$toolsDir\SonarLint.VSIX-4.10.0.9879-2017.vsix"  

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  vsixUrl     = 'file://' + $file.Replace('\', '/')
  VsVersion   = 15
}

Install-ChocolateyVsixPackage @packageArgs