$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Pkcs11Admin-0.4.0.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs "Pkcs11Admin.lnk"
$targetPath = Join-Path $toolsDir "Pkcs11Admin-0.4.0\Pkcs11Admin-x${OSArchitectureWidth}.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath