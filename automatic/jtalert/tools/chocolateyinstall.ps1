$packageName= 'jtalert'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
    $url_win10 = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.1_Setup.exe'
	$checksum_win10 = '045AA74C38AD0F5894CCDACBC57AF3E78F2FE10B0F80E712FDF46CC8126C72FD'
	$url = $url_win10
	$checksum = $checksum_win10
  } else {
    $url = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.1_Setup.exe'
	$checksum = '398ff08a0786cc0ed6884260cc1b4bf08b499cc8a5c5c14a9ab5aca6a0fcbf96'
}
  
$packageArgs = @{
  packageName   = $packageName
  url			= $url
  checksum      = $checksum
  checksumType  = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
