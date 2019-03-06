$packageName= 'jtalert'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.12.10_Setup.exe'
  
  checksum      = 'CD9E1C4079D4C64D6A057A948F60A288FF3771E336A29088CD36BD117BE17654'
  checksumType  = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs