if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.4_Setup.exe'
	$checksum_win10 = '9c9f18cadd6dda184bf236eb81eb61846636edbdc84d70f46e489907507a26c7'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url_others     = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.4_Setup.exe'
	$checksum_others= 'F5AF76C3A3D7E0C4420D550D303DE4BF8DC0E6418B74B4611F37858E5197543C'
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
