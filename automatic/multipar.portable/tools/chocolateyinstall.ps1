$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1305_setup.exe'
  checksum      = '98207E8F0E1011EAB4E9E0947F3ED6AA09E28EF92EC62C2786F89D1BE96C606C'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MultiPar.lnk"
$targetPath = Join-Path $toolsDir "MultiPar.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
