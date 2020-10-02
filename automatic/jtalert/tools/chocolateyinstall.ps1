$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/8f2537cb740130f112476341f25d02a9'
  checksum     = 'd98a5f2a3d2316820a9283632c195552e774da6b8185d274821c100ffd4fcb0e'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
