$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b3d58ee8fcba42913da34ee9e8c2c37f'
  checksum     = '4debbc68eebe3c9e3edde4609aee85528c4f064d07be31f5ed70822b88af4990'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
