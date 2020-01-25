$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.8.Setup.exe'
  checksum     = '012ab6d7072188d9dd15f779150abeae89862de5b2384023c8bf67dcdea3d615'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
