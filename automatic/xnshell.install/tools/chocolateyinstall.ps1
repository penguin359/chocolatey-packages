$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = 'A1356FE3BA6ED7C1914B970CCC87AB2A77403866A9E677321633032084A038B3'
  checksumType  = 'sha256'

  url64bit      = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = '9A4EAB980C441402EE5B040910110A61150A79A1F745E68002B9BE30ECCB9068'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs