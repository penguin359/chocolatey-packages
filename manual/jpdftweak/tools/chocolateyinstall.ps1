$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\jpdftweak-windows-x86-1.1.zip"
  file64      = "$toolsDir\jpdftweak-windows-x64-1.1.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "jPdf Tweak.lnk"
$targetPath = Join-Path $toolsDir "jpdftweak.bat"
Install-ChocolateyShortcut -WorkingDirectory "$toolsDir" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
