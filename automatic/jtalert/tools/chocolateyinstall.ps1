$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.6.Setup.exe'
  checksum     = 'ff7e17584e9353bbd8311aec9c8af109f9cf7b8ab7c51d549eb3d03b91bc90bb'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs