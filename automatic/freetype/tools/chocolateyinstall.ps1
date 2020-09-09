$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Copy-Item -Force "$toolsDir\win$(Get-OSArchitectureWidth)\freetype.dll" $env:SystemRoot\system32