$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/82468cd68282c70f58782e522e277e03'
  checksum     = 'aa788e17b828330014e091075470ec07a04aea48b19b38747d01baf2c35538ea'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
