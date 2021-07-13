$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b422cfdb13b5750d9ec2a5abe57ed806'
  checksum     = '2ea8eefe93b4fd5d53bffd23a6b064cf3c2341e722ab64707d1e47f16c22d33b'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
