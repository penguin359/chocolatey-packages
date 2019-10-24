$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'http://www.log4om.com/log4om/release/Log4OM_1_40_0_Portable.zip'
  checksum      = 'e561e30d570675fe1e5a539d03c4d9152108cc4115ef0ad98323c4122e0afc26'
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
