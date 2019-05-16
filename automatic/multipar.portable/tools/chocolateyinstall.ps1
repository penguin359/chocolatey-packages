$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1305.zip'
  checksum      = '8cbcc49e7034bf2b5aae35378e9173e68c03adc269fb2d0a6eb2b2f87d97c7a3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MultiPar.lnk"
$targetPath = Join-Path $toolsDir "MultiPar.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath