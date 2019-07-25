if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10       = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.14.0_Setup.exe'
	$checksum_win10  = 'b60230034a466a761c473295ab5821e40135e1232b75ab9e9f1a6bc2b7bc9933'
	$url             = $url_win10
	$checksum        = $checksum_win10
} else {
  $url_others      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.14.0_Setup.exe'
	$checksum_others = 'a52e2ad314923194b55ad9051aa97adcfa8b9ae1426d3335259807e439a9aca0'
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
