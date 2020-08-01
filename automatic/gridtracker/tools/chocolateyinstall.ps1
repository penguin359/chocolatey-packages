$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucdf1dbe277aaed9c96bec1ef13e.dl.dropboxusercontent.com/cd/0/get/A8ns9Vwr39LrqzbXUgEeLceUtu84jTgr3L37GOLbZq94EKvH3irI0FthGs1pnFk7y3LiYrJ0aMuOB38GzSS3Jw6uf8fNZscINptBKA7FcxvuQv_DCSMQbDhoQC2DDqoxyWo/file?dl=1#'
  checksum     = '38aae1e14052d07b6858cce20d133aee19e45a96d5515484dc7da2b744cfd2c5'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
