if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url_win10       = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_AL_2.14.2_Setup.exe'
	$checksum_win10  = '8930779710f143199f680cd107d0acb6d444efc5b5f8fcee6a48336c5ec1f208'
	$url             = $url_win10
	$checksum        = $checksum_win10
} else {
  $url_others      = 'https://dnl.hamapps.com/JTAlert/HamApps_JTAlert_2.14.2_Setup.exe'
	$checksum_others = 'afef943671112678e67ca6343a1b987eddd093cf186783bf2edb2fd1c34c146d'
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
