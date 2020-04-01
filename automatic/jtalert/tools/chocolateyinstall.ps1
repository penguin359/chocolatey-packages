$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/5ef7fbbd77eb6a94121d2880b882b815'
  checksum     = 'b77f9b3499617de675875e566efddf55af26549cb508671bd934eaff6cd844fd'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
