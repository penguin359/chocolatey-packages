$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Briss-2.0.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Briss.lnk"
$targetPath = Join-Path $toolsDir "Briss-2.0\bin\Briss-2.0.bat"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath -iconLocation "$toolsDir\Briss_icon_032x032.ico"