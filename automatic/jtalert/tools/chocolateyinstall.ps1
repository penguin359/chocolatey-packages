$packageName= 'jtalert'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  if ([environment]::OSVersion.Version.Major >= 10) {
    url = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.12.10_Setup.exe'
	checksum = 'CD9E1C4079D4C64D6A057A948F60A288FF3771E336A29088CD36BD117BE17654'
  } else {
    url = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.12.10_Setup.exe'
	checksum = '5D5E55A96DADF22104B8484C59125C7665BA6585925C6B899BB0F7CED2B5C6E0'
  }
  
  checksum      = 'CD9E1C4079D4C64D6A057A948F60A288FF3771E336A29088CD36BD117BE17654'
  checksumType  = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs