$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/75fb48895cd5c602fa32571e10e71829'
  checksum     = 'e3d3aecbe5df934e44d0cb10df891438af2b2894124b30912fe9a56151a84dc5'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
