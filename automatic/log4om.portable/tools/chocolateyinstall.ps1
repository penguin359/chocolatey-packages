$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'http://www.log4om.com/log4om/release/Log4OM_1_39_0_Portable.zip'
  checksum      = '5225e268e393d8a0b5756555021b121e273851b36a5e02d08fb0cde826731e7a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
    
# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Log4OM.lnk"
$targetPath = Join-Path $toolsDir "portable\LogOMUI.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs "Log4om Communicator standalone.lnk"
$targetPath = Join-Path $toolsDir "portable\Log4OmCommunicator.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warning "If dotnetfx has just been installed, you have to restart your computer before using Log4OM."
