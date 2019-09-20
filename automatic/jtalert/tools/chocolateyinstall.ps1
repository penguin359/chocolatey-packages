if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10       = 'https://dnl.hamapps.com/JTAlert/JTAlert.AL.2.14.4.Setup.exe'
	$checksum_win10  = 'd4d3f37d0abf5a14492f37fde60b8cea58bcc92483466b5fb2af6a31f32e6981'
	$url             = $url_win10
	$checksum        = $checksum_win10
} else {
  $url_others      = 'https://dnl.hamapps.com/JTAlert/JTAlert.2.14.4.Setup.exe'
	$checksum_others = '08483abb8f0fdf81c614550b67a3caecd2e68f654aab447a47c40793036e9053'
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
