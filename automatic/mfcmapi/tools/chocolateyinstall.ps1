$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$binRoot     =  Get-ToolsLocation
$installDir  = Join-Path "$binRoot" "$packageName"

$file        = "$toolsDir\MFCMAPI.exe.20.2.20104.1136.zip"
$file64      = "$toolsDir\MFCMAPI.exe.x64.20.2.20104.1136.zip"

# We're going to copy both the 32-bit and 64-bit executables, because
# the bitness of Outlook won't necessarily match the bitness of the
# OS.
Get-ChocolateyUnzip -PackageName $packageName -Destination "$InstallDir\x86" -FileFullPath "$toolsDir\MFCMAPI.exe.20.2.20104.1136.zip" 
Get-ChocolateyUnzip -PackageName $packageName -Destination "$InstallDir\x64" -FileFullPath "$toolsDir\MFCMAPI.exe.x64.20.2.20104.1136.zip"
