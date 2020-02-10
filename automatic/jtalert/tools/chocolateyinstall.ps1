$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.9.Setup.exe'
  checksum     = 'c4ac9299e2c47eabf139a01acc90b2ed51f439208f0d2f88ef37898ed8bac003'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
