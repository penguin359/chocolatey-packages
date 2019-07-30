if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10       = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.14.1_Setup.exe'
	$checksum_win10  = 'f4ec8fac74bc2269993b18d045014991372076c8c7540a111ddc31084371c075'
	$url             = $url_win10
	$checksum        = $checksum_win10
} else {
  $url_others      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.14.1_Setup.exe'
	$checksum_others = '82b6e361b0711e77b96e69f9fdcb037a49b2d9aced657200b4e56015d026875e'
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
