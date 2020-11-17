$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'C90A2F5CC27995D6D06F218EEAC129FCF133875DBEA41EA1652C6AB921F024ADDAEFFB192836F70A8342C04E0024CEBA3037AD997DD0CAF46FE0051EB150C186'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
