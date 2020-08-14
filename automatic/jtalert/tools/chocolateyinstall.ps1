$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/5e52a6b9288e324940dfe33d48ad3685'
  checksum     = '5a7ec784580cdce2bddaed61238b113ef45571455e41a2e685bc553281ba6b2a'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
