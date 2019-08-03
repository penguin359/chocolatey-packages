$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\tabula-win-1.2.1.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Tabula.lnk"
$targetPath = Join-Path $toolsDir "tabula\tabula.exe"
Install-ChocolateyShortcut -WorkingDirectory "$toolsDir\tabula" -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath