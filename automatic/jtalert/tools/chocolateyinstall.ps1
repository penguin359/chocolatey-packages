$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.5.Setup.exe'
  checksum     = '5ebf7db212d66c86afdfb71dd14e996a27969fd3e34df78e1813ce8376401c3b'
  checksumType = 'sha256'

  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
