$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName   = $env:ChocolateyPackageName
$binRoot       =  Get-ToolsLocation
$installDir    = Join-Path "$binRoot" "$packageName"

$file          = $12019.2.19207.938.zip"
$file64        = $12019.2.19207.938.zip"

# We're going to copy both the 32-bit and 64-bit executables, because
# the bitness of Outlook won't necessarily match the bitness of the
# OS.
Get-ChocolateyUnzip -PackageName $packageName -Destination "$InstallDir\x86" -FileFullPath $12019.2.19207.938.zip" 
Get-ChocolateyUnzip -PackageName $packageName -Destination "$InstallDir\x64" -FileFullPath $12019.2.19207.938.zip"
