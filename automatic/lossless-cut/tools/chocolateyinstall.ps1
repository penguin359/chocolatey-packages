$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/mifi/lossless-cut/releases/download/v2.4.0/LosslessCut-win32-ia32.zip'
  checksum       = '0F87BD29D44266F65F30ECE2AF766347B4D4E16FD9CD753F24BC75EE35252F0B'
  checksumType   = 'sha256'

  url64          = 'https://github.com/mifi/lossless-cut/releases/download/v2.4.0/LosslessCut-win32-x64.zip'
  checksum64     = '49CF1E1A250FAB8DFD42F33CE4E7D4E1DE19EBD29CAA975CE579CF22E7DC130F'
  checksumType64 = 'sha256'
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