$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.bandlab.com/download/assistant/windows'
  checksum      = 'B9D75C6F31A1225A38555EC560650AE6592DE5E156557617E42D9A5F51451526'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs