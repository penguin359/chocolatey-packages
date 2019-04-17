$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url           = 'https://multipar.eu/downloads/1.3.0/MultiPar1304.zip'
  checksum      = 'AA03AB3E22F544E8CEDD05BAFBD2E607768FA4B00921521A9E31F251D9878425'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MultiPar.lnk"
$targetPath = Join-Path $toolsDir "MultiPar.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath