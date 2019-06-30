$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\LosslessCut-win32-ia32.zip"
  file64        = "$toolsDir\LosslessCut-win32-x64.zip"  
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude LosslessCut.exe
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
if (Get-OSArchitectureWidth -Compare "32") { $dir = "LosslessCut-win32-ia32" } else { $dir = "LosslessCut-win32-x64" }
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "LosslessCut.lnk"
$targetPath = Join-Path $toolsDir "$dir\LosslessCut.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath