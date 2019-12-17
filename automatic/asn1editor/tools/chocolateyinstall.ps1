$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Asn1Editor-v1.4.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs "ASN.1 Editor.lnk"
$targetPath = Join-Path $toolsDir "Asn1Editor-v1.4\Asn1Editor-x${OSArchitectureWidth}.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
