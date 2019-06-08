$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
  checksum      = 'eece02948a5f39f907f92e47970b550115c44ce7f56853ed799c38f95b0f2fff'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
