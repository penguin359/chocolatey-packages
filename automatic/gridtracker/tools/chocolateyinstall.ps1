$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucf437382485f56470b815913b75.dl.dropboxusercontent.com/cd/0/get/A9y0TGaiex4KHrcLQJmJ32ou_gqsJTCzg5LyKA4X4-zQrWbr8SIUsozXbm854zpCSyKGTXjIwXHT6xHlpE8MNdTe8W8rUBJSnyFME3PWjkHxXciu3yyMEL8szjRiuySjK2E/file?dl=1#'
  checksum     = '84658e597839cbd7dec09a1c1d91cee3cb01a5074de6fba51e43f6675124b161'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
