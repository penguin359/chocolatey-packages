$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\avinaptic2-win32-20111218.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AVinaptic.lnk"
$targetPath = Join-Path $toolsDir "avinaptic2-20111218\avinaptic2.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath -WorkingDirectory "$toolsDir\avinaptic2-20111218"