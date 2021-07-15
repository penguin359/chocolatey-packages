$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/37eec2ff5f60d82832f4725c1a4b15e3'
  checksum     = '575e4fa81c8ea605dda8e15424acd633e868c78c8131570fdad99efcd81c3f7a'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
