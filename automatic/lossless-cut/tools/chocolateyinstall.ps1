$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = "https://github.com/mifi/lossless-cut/releases/download/v2.3.0/LosslessCut-win32-ia32.zip"
  checksum       = "C6590B06BC65D889563A490F861D26DF998B7CFC355B012EC71503EF79FC41CE"
  checksumType   = "sha256"

  url64          = "https://github.com/mifi/lossless-cut/releases/download/v2.3.0/LosslessCut-win32-x64.zip"
  checksum64     = "930B2FC7D4F6FB28D20769229CB9A73DBEDFC19983F6F3F18CB9CFB282EE3A24"
  checksumType64 = "sha256"  
}

Install-ChocolateyZipPackage @packageArgs

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