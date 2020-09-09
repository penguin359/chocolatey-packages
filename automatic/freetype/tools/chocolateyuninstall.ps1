$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Remove-Item -Force "$env:SystemRoot\system32\freetype.dll"