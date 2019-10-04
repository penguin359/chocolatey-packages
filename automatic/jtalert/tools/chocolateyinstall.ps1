$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/JTAlert.2.14.5.Setup.exe'
  checksum     = 'd4f6238cfe5afd6aed608ca7813f2d33d5f0734e779ed2fe3125648e22cc78f7'
  checksumType = 'sha256'

  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
