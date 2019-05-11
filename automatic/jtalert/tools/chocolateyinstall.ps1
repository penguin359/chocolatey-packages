if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.5_Setup.exe'
	$checksum_win10 = 'a6dec0dabfebfe8df8530958de5dedf5962adb7baaf5a188050b735409f0220b'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url_others     = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.5_Setup.exe'
	$checksum_others= '68ca1374c2af00fabe75318c1e759ccce0fd7371377152c44d46ab89986cebdd'
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
