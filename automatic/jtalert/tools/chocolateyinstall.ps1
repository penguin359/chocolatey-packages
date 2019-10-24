$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/JTAlert.2.15.0.Setup.exe'
  checksum     = 'ddf1a3a8e37687213ae827a43a6505e53b8d5de243f9635b8b529e102fb8f513'
  checksumType = 'sha256'

  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
