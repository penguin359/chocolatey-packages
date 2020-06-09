$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/e8021fc6ed8a59e54550b5607adc7114'
  checksum     = '3849db70b6ad80b037437f21f2f6669bdb28a4dea7c3e4880f6cbae5bcd47032'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
