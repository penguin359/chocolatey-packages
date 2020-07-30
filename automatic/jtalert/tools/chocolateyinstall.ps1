$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/a4e4d5c79891f67f194339ba56e9ab24'
  checksum     = '4ab86d38561a95248579ef84c4fbe163ec16a0ca44e7f669da708bdaf87a452d'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
