$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.11.Setup.exe'
  checksum     = '1ac0a24162ab66caec342e131a9b01119612fd62a4e4c9c3f47aa6c6a3e41c92'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
