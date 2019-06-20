if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.8_Setup.exe'
	$checksum_win10 = '785c1aa8d65cebfe74e7a53c7d4a9fb779e49f020289fed3edd98adcd7afbab8'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url_others     = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.8_Setup.exe'
	$checksum_others= 'b8b6d31c29491a8f9352a2698059e47fae5331e7361e94a7dbbd57625bd75735'
  $url            = $url_others
  $checksum       = $checksum_others
}
  
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
