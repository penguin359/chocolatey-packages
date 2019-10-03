$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/JTAlert.2.14.4.Setup.exe'
  checksum     = '08483abb8f0fdf81c614550b67a3caecd2e68f654aab447a47c40793036e9053'
  checksumType = 'sha256'

  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs