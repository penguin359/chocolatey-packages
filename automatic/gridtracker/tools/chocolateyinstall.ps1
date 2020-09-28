$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucc1a10a4e6f11f921a07c89d2a6.dl.dropboxusercontent.com/cd/0/get/BAOxrzrOayYcwNQWGbQKbZ1GJEP0JsEoum2Vz1hT4HbZvlqN7tr7RB7EbfhxW6AmUxwDXNwQ8umJM9h9oTAjjx7fBWQFwl2BJpav5jcc4qBPNaPB6IMeGqGLhDQMPxMExws/file?dl=1#'
  checksum     = '213503faa2c3b52efd26a5fa8b1cd9f7b039c6aab4502265061c8090be0cc32e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
