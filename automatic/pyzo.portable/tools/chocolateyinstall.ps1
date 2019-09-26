$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $file64_win10 = "$toolsDir\pyzo-4.9.0-win64-windows10.zip"    
  $file64       = "$file64_win10"
} else {
  $file64_win7 = "$toolsDir\pyzo-4.9.0-win64-windows7.zip"
  $file64      = "$file64_win7"
}

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$file64"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Pyzo.lnk"
$targetPath = Join-Path $toolsDir "pyzo-4.9.0\pyzo.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
