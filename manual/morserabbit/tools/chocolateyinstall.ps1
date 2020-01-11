$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url           = 'https://sector-seven.com/assets/downloads/morserabbit.zip'
  checksum      = '227490C2E9EF1E2F7730846654A28A1E715AE509887EB1ED455C99B1BAF83750'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MorseRabbit.lnk"
$targetPath = Join-Path $toolsDir "MorseRabbit.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"