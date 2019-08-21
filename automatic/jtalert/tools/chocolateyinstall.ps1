if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10       = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.14.3_Setup.exe'
	$checksum_win10  = '965ef85c6cdf1ee511d93d833741836a35f84e8a0a4107a84e18f7981e7d0d4b'
	$url             = $url_win10
	$checksum        = $checksum_win10
} else {
  $url_others      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.14.3_Setup.exe'
	$checksum_others = 'fded970faf1dfe2a82ba7efb58a0f23b7291c01a592653bb115892fb908aa0a9'
  $url             = $url_others
  $checksum        = $checksum_others
}
  
$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = $url
  checksum     = $checksum
  checksumType = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
