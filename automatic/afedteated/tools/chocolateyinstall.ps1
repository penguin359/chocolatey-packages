$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum      = '537fe6eca918cb4fc21b60f659428c728627c2da88541977b169ebda7a7ab9faeacee93f131610428bda13e023319f54fc26ddf4da9dc90362ade8f41af92594'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs