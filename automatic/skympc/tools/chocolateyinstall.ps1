$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\SkyMPC-1.6.4-windows.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SkyMPC.lnk"
$targetPath = Join-Path $toolsDir "SkyMPC\SkyMPC.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath