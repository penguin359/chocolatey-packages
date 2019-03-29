if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.13.2_Setup.exe'
	$checksum_win10 = '9DB2BAAB29516741FAC2DE8CE5E361F55DD18CF8F1AFDAA3FB6460908E2DAC51'
	$url            = $url_win10
	$checksum       = $checksum_win10
} else {
  $url            = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.13.2_Setup.exe'
	$checksum       = '88e4d491d5145307c2c036502b1bac8c11aac6895ad7ba2b28e6eeb497a22748'
}
  
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  
  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs