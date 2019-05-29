if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.7_Setup.exe'
	$checksum_win10 = '63ec2425e9c1c38430cddd5fcba38a5614a50f6579102641deceed8effbfdd64'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url_others     = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.7_Setup.exe'
	$checksum_others= 'e0a11f15a61f3faac6c588356da39e71843e52f50c5746c2fca0f9f357c9c16e'
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
