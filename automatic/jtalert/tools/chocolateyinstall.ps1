$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/de49b5b60346120af92ca07352ac83a7'
  checksum     = 'fde560cad7d8c9663e0f979fe5817396045bc36ba858c88fc884d881d19822fb'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
