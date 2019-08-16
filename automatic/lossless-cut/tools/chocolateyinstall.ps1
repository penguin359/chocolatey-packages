$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/mifi/lossless-cut/releases/download/v2.3.0/LosslessCut-win32-ia32.zip'
  checksum       = 'c6590b06bc65d889563a490f861d26df998b7cfc355b012ec71503ef79fc41ce'
  checksumType   = 'sha256'

  url64          = 'https://github.com/mifi/lossless-cut/releases/download/v2.3.0/LosslessCut-win32-x64.zip'
  checksum64     = '930b2fc7d4f6fb28d20769229cb9a73dbedfc19983f6f3f18cb9cfb282ee3a24'
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
