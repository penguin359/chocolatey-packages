$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/ad2b075da7be05bd05ed8c1e7bce574a'
  checksum     = '9b6a13a16654c46a5efd0aa968fe591e232f3fc17ebfad16624d08c14e3312e4'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
