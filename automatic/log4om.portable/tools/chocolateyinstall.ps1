$fileName = "LogOMUI.exe"
$linkName = "LogOMUI.lnk"
$fileName_Log4OmCommunicator = "Log4OmCommunicator.exe"
$linkName_Log4OmCommunicator = "Log4OmCommunicator.lnk"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = "log4om.portable"
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'http://www.log4om.com/log4om/release/Log4OM_1_36_0_Portable.zip'
  checksum      = 'DF15688CF768556C520DC654508657B78A58F7222DD2B9AC6F2323A5596BDD49'
  checksumType  = 'sha256'
}
    
Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs $linkName
$targetPath = Join-Path $toolsDir "portable\$fileName"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs $linkName_Log4OmCommunicator
$targetPath = Join-Path $toolsDir "portable\$fileName_Log4OmCommunicator"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath