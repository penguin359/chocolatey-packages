$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.bandlab.com/download/assistant/windows'
  checksum      = '29b45a53105f592c72ed6129dcd617681be647bf8f646bf07ad17805ed6eed31'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
