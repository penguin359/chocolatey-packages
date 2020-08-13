$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/9ed78013172993d0dee5e54f34fe573a'
  checksum     = '74138aa532baa9db4fdb15d95a47f3f30d3ebc563a2252318930a9974f9b6306'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
