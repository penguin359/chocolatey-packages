$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/mifi/lossless-cut/releases/download/v3.12.0/LosslessCut-win.zip'
  checksum       = 'D2C21D917E6F75F9CE1ED95AF575672E576A832124A435AEF7F4E67BA53EA469'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude LosslessCut.exe
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "LosslessCut.lnk"
$targetPath = Join-Path $toolsDir "LosslessCut.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
