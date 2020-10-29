$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\NSudo_8.0_All_Components.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "NSudo.lnk"
$targetPath = Join-Path $toolsDir "NSudo_8.0_All_Components\NSudo Launcher\NSudo.bat"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
