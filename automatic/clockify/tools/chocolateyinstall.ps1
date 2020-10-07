$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'D230D467F1F930FA73BDDD764B0D15CEF0A2C18C8C3B5E1A24AEAABCA84C94EC90F901446899123DDFCF03CF7C4E11DCE272E316CE1501C31BA7CB93AB15BA18'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
