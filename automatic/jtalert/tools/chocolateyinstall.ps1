$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/7d84629321b2986afb81de7f662a8449'
  checksum     = '535cb82ae034602315cbdfda3e9b3ae93cf2436abd010890fa78193068a6240d'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
