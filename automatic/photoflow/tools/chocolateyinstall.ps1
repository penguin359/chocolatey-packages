$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\photoflow-0.2.8.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude photoflow.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PhotoFlow.lnk"
$targetPath = Join-Path $toolsDir "photoflow-0.2.8\bin\photoflow.exe"
$iconPath = Join-Path $toolsDir "photoflow.ico"
Install-ChocolateyShortcut -IconLocation "$iconPath" -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"