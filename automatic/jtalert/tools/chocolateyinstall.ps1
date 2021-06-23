$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/82acac497fae0b65329fc2b00007f3db'
  checksum     = '8f4bdf57ceceefb0bc9a3a3e0f7238b9fdf26056e7b2422b3a70118a25d47e91'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
