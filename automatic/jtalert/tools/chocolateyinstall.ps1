$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.10.Setup.exe'
  checksum     = '64652d0c59a510d7b8f2490b79c99c36f0f52869e74a53643424f0036c646d22'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
