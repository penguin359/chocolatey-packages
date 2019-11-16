$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://files.hamapps.com/JTAlert/JTAlert.2.15.3.Setup.exe'
  checksum     = '5cf2c4af18391ec33ab81a787cc5a34998b49b7d280df8b63b82e048c83e0fbe'
  checksumType = 'sha256'

  silentArgs 	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
