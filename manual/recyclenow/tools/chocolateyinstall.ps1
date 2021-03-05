$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

### PARAMETERS
If ($PackageParameters.InstallDir) {
  $installDir = $PackageParameters.InstallDir
} Else {
  $installDir = "$toolsDir"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installDir"
  fileType      = 'exe'

  url           = 'https://bluefive.pairsite.com/RecycleNOW.zip'
  checksum      = '29D631E693005D722267AD7F52437443612CD36C6907E2F1EF1273C03FF1975F'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path "$installDir" 'RecycleNOW\RecycleNOW.exe'

# Add start menu shortcut
If (-Not( $PackageParameters.NoStartMenu )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
  $programsFilePath = Join-Path $programsPath "RecycleNOW.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

# Install desktop icon
If ( $PackageParameters.DesktopIcon ) {  
  Install-ChocolateyShortcut -shortcutFilePath "$Env:USERPROFILE\Desktop\RecycleNOW.lnk" -targetPath "$targetPath"
}
