$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/05176edaa913b9fad3b443a5815a87da'
  checksum     = '2f7653d55b104e2f7e9b828085ef3692d3eb80b77955e6e9c5c151de865bcc24'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
