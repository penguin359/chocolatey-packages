if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.9_Setup.exe'
	$checksum_win10 = '0049baf5a77cc52770833ee1749427027cbb4b399b057be9768f4276cf9fc5f4'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url_others     = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.9_Setup.exe'
	$checksum_others= '010ad503123be44a8f0943a5568bc5067d6fe0b3cf5a2617d9d6dab95a1e2a29'
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
