$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b4d05b5174ca5c7c1ee3f9bf01b911d8'
  checksum     = '3a24c02c35560cc247403d27b25ad05e534d37f29a9a69b752520c2b85cfe909'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
