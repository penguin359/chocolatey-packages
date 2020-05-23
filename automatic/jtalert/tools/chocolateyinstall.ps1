$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/a5747169e98588bff0c654d072a999cd'
  checksum     = 'e07bd53831a3d313d7813867d43eab299ead45066302b61a63c627d990671580'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
